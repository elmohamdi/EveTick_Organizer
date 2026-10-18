import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/ticket_tier_sales.dart';
import 'package:evetick_organizer/features/event_dashboard/data/repositories/event_dashboard_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Reads the dashboard numbers for one event.
///
/// Uses the same schema as the ticket scanner:
///
/// events/{eventId}                      -> event document (ticketTiers[] has
///                                          ticketName / ticketPrice / ticketQuantity)
/// events/{eventId}/tickets/{ticketCode} -> one doc per sold ticket with
///     ticketName: String   (must equal the tier's `ticketName`)
///     checkedIn:  bool
///
/// Sold tickets and revenue are derived from Firestore *count aggregations*
/// (one per tier), so we never download the ticket documents themselves: the
/// cost stays flat no matter how many tickets were sold.
/// Revenue = sold x current tier price. If tier prices can change after
/// tickets were sold, store the paid `price` on each ticket and switch to a
/// `sum()` aggregation instead.
class EventDashboardRepositoryImpl implements EventDashboardRepository {
  EventDashboardRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  @override
  Future<Result<EventDashboard>> getDashboard(String eventId) async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) {
        return Result.failure(FirebaseFailure('You must be logged in'));
      }

      final eventRef = _firestore.collection('events').doc(eventId);
      final snapshot = await eventRef.get();
      final data = snapshot.data();
      if (!snapshot.exists || data == null) {
        return Result.failure(FirebaseFailure('Event not found'));
      }
      final isOrganizer = data['organizerId'] == uid;
      if (!isOrganizer &&
          !await _isStaffWith(eventId, StaffPermission.viewAnalytics)) {
        return Result.failure(FirebaseFailure('Permission denied'));
      }

      final rawTiers = (data['ticketTiers'] as List<dynamic>?) ?? const [];
      final tierMaps = rawTiers
          .whereType<Map>()
          .map((tier) => Map<String, dynamic>.from(tier))
          .toList();

      final tickets = eventRef.collection('tickets');

      // Every tier + the checked-in count, all in parallel. The last element
      // of [counts] is the checked-in count.
      final counts = await Future.wait<int>([
        for (final tier in tierMaps)
          _count(
            tickets.where(
              'ticketName',
              isEqualTo: _asString(tier['ticketName'], ''),
            ),
          ),
        _count(tickets.where('checkedIn', isEqualTo: true)),
      ]);

      final tiers = <TicketTierSales>[
        for (var i = 0; i < tierMaps.length; i++)
          TicketTierSales(
            name: _asString(tierMaps[i]['ticketName'], 'Ticket'),
            price: _asNum(tierMaps[i]['ticketPrice']).toDouble(),
            capacity: _asNum(tierMaps[i]['ticketQuantity']).toInt(),
            sold: counts[i],
          ),
      ];

      return Result.success(
        EventDashboard(
          eventId: eventId,
          title: _asString(data['eventTitle'], 'No Title'),
          status: _asString(data['status'], 'pending'),
          isOnline: data['isOnlineEvent'] == true,
          location: _asString(data['eventLocation'], ''),
          coverImageUrl: data['coverImageUrl']?.toString(),
          category: data['eventCategory']?.toString(),
          startAt: DateTime.tryParse(_asString(data['startAt'], '')),
          endAt: DateTime.tryParse(_asString(data['endAt'], '')),
          tiers: tiers,
          checkedIn: counts.last,
          isOrganizer: isOrganizer,
        ),
      );
    } on FirebaseException catch (e) {
      debugPrint('EventDashboard FirebaseException: ${e.code} ${e.message}');
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e, stackTrace) {
      debugPrint('EventDashboard error: $e\n$stackTrace');
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  /// Accepted staff member (invitation answered -> status `active`, bound to
  /// this uid by the backend) that holds [permission] on [eventId].
  Future<bool> _isStaffWith(String eventId, StaffPermission permission) async {
    final user = _auth.currentUser;
    final email = user?.email?.toLowerCase();
    if (user == null || email == null) return false;

    try {
      final snapshot = await _firestore
          .collection('events')
          .doc(eventId)
          .collection('staff')
          .doc(email)
          .get();
      final staff = snapshot.data();
      if (staff == null) return false;

      final permissions = staff['permissions'];
      return staff['status'] == 'active' &&
          staff['uid'] == user.uid &&
          permissions is Map &&
          permissions[permission.key] == true;
    } on FirebaseException {
      return false; // rules refused: not staff of this event
    }
  }

  num _asNum(Object? value) =>
      value is num ? value : (num.tryParse(value?.toString() ?? '') ?? 0);

  String _asString(Object? value, String fallback) =>
      value?.toString() ?? fallback;

  Future<int> _count(Query<Map<String, dynamic>> query) async {
    final aggregate = await query.count().get();
    return aggregate.count ?? 0;
  }
}

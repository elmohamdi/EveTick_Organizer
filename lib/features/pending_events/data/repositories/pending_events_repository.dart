import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/staff_access/data/models/staff_access_models.dart';
import 'package:evetick_organizer/features/staff_access/data/repositories/staff_access_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class PendingEventsRepository {
  PendingEventsRepository({StaffAccessRepository? staffAccess})
    : _staffAccess = staffAccess ?? StaffAccessRepository();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StaffAccessRepository _staffAccess;

  static const List<String> _visibleStatuses = ['pending', 'live'];

  /// Returns the events created by the currently logged-in organizer plus the
  /// events they work on as accepted staff (marked with `isStaffEvent`),
  /// whose status is `pending` or `live`.
  ///
  /// The status filter is applied on the client so the query only needs a
  /// single equality filter (no composite index required).
  Future<List<Map<String, dynamic>>> getPendingEvents() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return [];

      final snapshot = await _firestore
          .collection('events')
          .where('organizerId', isEqualTo: uid)
          .get();

      final own = snapshot.docs
          .map((doc) => {...doc.data(), 'eventId': doc.data()['eventId'] ?? doc.id})
          .where((data) => _visibleStatuses.contains(data['status']))
          .toList();

      final ownIds = own.map((event) => event['eventId']).toSet();
      final staffEvents = await _staffEvents(excludeIds: ownIds);

      return [...own, ...staffEvents];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Events the user was invited to and accepted. A failure here (offline,
  /// functions not deployed yet, ...) must not hide the user's own events.
  Future<List<Map<String, dynamic>>> _staffEvents({
    required Set<Object?> excludeIds,
  }) async {
    final Result<StaffAccess> result = await _staffAccess.getMyAccess();
    return result.when<List<Map<String, dynamic>>>(
      success: (access) => [
        for (final assignment in access.assignments)
          if (_visibleStatuses.contains(assignment.event['status']) &&
              !excludeIds.contains(assignment.eventId))
            {
              ...assignment.event,
              'isStaffEvent': true,
              'staffRole': assignment.role.key,
              'canManage': assignment.can(StaffPermission.viewAnalytics),
            },
      ],
      failure: (failure) {
        debugPrint('Staff events not loaded: ${failure.message}');
        return <Map<String, dynamic>>[];
      },
    );
  }
}

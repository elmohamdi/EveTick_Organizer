import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/staff_access/data/repositories/staff_access_repository.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_event.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_result.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_status.dart';
import 'package:evetick_organizer/features/ticket_scan/data/repositories/ticket_scan_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Firestore implementation.
///
/// Expected schema (the project has no tickets collection yet, so this is the
/// contract the attendee app / backend must follow):
///
/// events/{eventId}                      -> existing event document
/// events/{eventId}/tickets/{ticketCode} -> one document per sold ticket, where
///     {ticketCode} is exactly the string encoded in the ticket's QR code
///     attendeeName: String
///     ticketName:   String   (tier name, e.g. "VIP Access")
///     checkedIn:    bool     (missing/false until scanned)
///     checkedInAt:  Timestamp  (written by this class)
///     checkedInBy:  String     (organizer uid, written by this class)
class TicketScanRepositoryImpl implements TicketScanRepository {
  TicketScanRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    StaffAccessRepository? staffAccess,
  }) : _firestore = firestore,
       _auth = auth,
       _staffAccess = staffAccess ?? StaffAccessRepository();

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final StaffAccessRepository _staffAccess;

  CollectionReference<Map<String, dynamic>> _tickets(String eventId) =>
      _firestore.collection('events').doc(eventId).collection('tickets');

  @override
  Future<Result<List<ScanEvent>>> getScannableEvents() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return const Result.success(<ScanEvent>[]);

      // Only this organizer's events. Status is filtered on the client so the
      // query needs just one equality filter (no composite index required).
      final snapshot = await _firestore
          .collection('events')
          .where('organizerId', isEqualTo: uid)
          .get();

      final events = snapshot.docs
          .where((doc) => ['pending', 'live'].contains(doc.data()['status']))
          .map((doc) {
        final data = doc.data();
        final tiers = (data['ticketTiers'] as List<dynamic>?) ?? const [];
        final totalExpected = tiers.fold<int>(0, (sum, tier) {
          final quantity = tier is Map ? tier['ticketQuantity'] : null;
          return sum + (quantity is num ? quantity.toInt() : 0);
        });
        return ScanEvent(
          id: (data['eventId'] as String?) ?? doc.id,
          title: (data['eventTitle'] as String?) ?? 'Untitled event',
          totalExpected: totalExpected,
          isLive: data['status'] == 'live',
        );
      }).toList();

      // Events where the user is accepted staff with the scan permission.
      // If this lookup fails the organizer still gets their own events.
      final staffResult = await _staffAccess.getMyAccess();
      staffResult.when<void>(
        success: (access) {
          final knownIds = events.map((event) => event.id).toSet();
          for (final assignment in access.assignments) {
            final data = assignment.event;
            if (!assignment.can(StaffPermission.scanTickets)) continue;
            if (!['pending', 'live'].contains(data['status'])) continue;
            if (!knownIds.add(assignment.eventId)) continue;
            events.add(
              ScanEvent(
                id: assignment.eventId,
                title: (data['eventTitle'] as String?) ?? 'Untitled event',
                totalExpected: (data['totalExpected'] as num?)?.toInt() ?? 0,
                isLive: data['status'] == 'live',
              ),
            );
          }
        },
        failure: (failure) =>
            debugPrint('Staff scan events not loaded: ${failure.message}'),
      );

      return Result.success(events);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  @override
  Future<Result<int>> getScannedCount(String eventId) async {
    try {
      final snapshot = await _tickets(
        eventId,
      ).where('checkedIn', isEqualTo: true).count().get();
      return Result.success(snapshot.count ?? 0);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  @override
  Future<Result<ScanResult>> verifyTicket({
    required String eventId,
    required String code,
  }) async {
    // A Firestore document id can't contain "/", so such a code can't exist.
    if (code.contains('/')) {
      return const Result.success(ScanResult(status: ScanStatus.invalid));
    }

    try {
      final ticketRef = _tickets(eventId).doc(code);

      final result = await _firestore.runTransaction<ScanResult>((
        transaction,
      ) async {
        final snapshot = await transaction.get(ticketRef);
        final data = snapshot.data();
        if (!snapshot.exists || data == null) {
          return const ScanResult(status: ScanStatus.invalid);
        }

        final attendeeName = data['attendeeName'] as String?;
        final ticketType = data['ticketName'] as String?;

        if (data['checkedIn'] == true) {
          return ScanResult(
            status: ScanStatus.alreadyScanned,
            attendeeName: attendeeName,
            ticketType: ticketType,
          );
        }

        transaction.update(ticketRef, {
          'checkedIn': true,
          'checkedInAt': FieldValue.serverTimestamp(),
          'checkedInBy': _auth.currentUser?.uid,
        });
        return ScanResult(
          status: ScanStatus.verified,
          attendeeName: attendeeName,
          ticketType: ticketType,
        );
      });

      return Result.success(result);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }
}

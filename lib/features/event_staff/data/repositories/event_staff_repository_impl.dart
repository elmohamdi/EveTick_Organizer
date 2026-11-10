import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/firebase_error_handler.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_staff/data/models/event_staff_member.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';
import 'package:evetick_organizer/features/event_staff/data/repositories/event_staff_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Firestore implementation.
///
/// events/{eventId}/staff/{email}   ({email} = lower-cased email)
///     name:        String
///     email:       String
///     role:        String   (StaffRole.key, only a label)
///     permissions: Map<String, bool>   (StaffPermission.key -> allowed)
///     status:      'pending' | 'active'   (flipped to active when the
///                  invited organizer accepts, from their own app/backend)
///     invitedBy:   String   (organizer uid)
///     invitedAt:   Timestamp
class EventStaffRepositoryImpl implements EventStaffRepository {
  EventStaffRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  CollectionReference<Map<String, dynamic>> _staff(String eventId) =>
      _firestore.collection('events').doc(eventId).collection('staff');

  @override
  Future<Result<List<EventStaffMember>>> getStaff(String eventId) async {
    try {
      final snapshot = await _staff(eventId).get();
      final members =
          snapshot.docs
              .map((doc) => EventStaffMember.fromMap(doc.id, doc.data()))
              .toList()
            ..sort(
              (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
            );
      return Result.success(members);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e, stackTrace) {
      debugPrint('EventStaff error: $e\n$stackTrace');
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  @override
  Future<Result<EventStaffMember>> inviteStaff({
    required String eventId,
    required String name,
    required String email,
    required StaffRole role,
    required Set<StaffPermission> permissions,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      return Result.failure(FirebaseFailure('You must be logged in'));
    }

    final normalizedEmail = email.trim().toLowerCase();
    // A Firestore document id can't contain "/".
    if (normalizedEmail.isEmpty || normalizedEmail.contains('/')) {
      return Result.failure(FirebaseFailure('Invalid email format'));
    }
    if (user.email?.toLowerCase() == normalizedEmail) {
      return Result.failure(
        FirebaseFailure('You are already the organizer of this event'),
      );
    }

    final member = EventStaffMember(
      id: normalizedEmail,
      name: name.trim(),
      email: normalizedEmail,
      role: role,
      permissions: permissions,
      status: StaffInviteStatus.pending,
    );

    try {
      final ref = _staff(eventId).doc(normalizedEmail);
      await _firestore.runTransaction((transaction) async {
        final existing = await transaction.get(ref);
        if (existing.exists) throw const _AlreadyInvitedException();

        transaction.set(ref, {
          ...member.toMap(),
          'invitedBy': user.uid,
          'invitedAt': FieldValue.serverTimestamp(),
        });
      });
      return Result.success(member);
    } on _AlreadyInvitedException {
      return Result.failure(
        FirebaseFailure('This person has already been invited'),
      );
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e, stackTrace) {
      debugPrint('EventStaff error: $e\n$stackTrace');
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }

  @override
  Future<Result<void>> removeStaff({
    required String eventId,
    required String staffId,
  }) async {
    try {
      await _staff(eventId).doc(staffId).delete();
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.failure(FirebaseErrorHandler.handleFirestore(e));
    } catch (e, stackTrace) {
      debugPrint('EventStaff error: $e\n$stackTrace');
      return Result.failure(FirebaseErrorHandler.handleGeneric(e));
    }
  }
}

class _AlreadyInvitedException implements Exception {
  const _AlreadyInvitedException();
}

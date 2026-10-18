import 'package:evetick_organizer/core/services/failure.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/staff_access/data/models/staff_access_models.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_functions/cloud_functions.dart' hide Result;

/// Must be the same region as `REGION` in functions/index.js.
const String kFunctionsRegion = 'us-central1';

/// Talks to the `getMyStaffAccess` / `respondToStaffInvite` Cloud Functions.
class StaffAccessRepository {
  StaffAccessRepository({FirebaseFunctions? functions})
    : _functions =
          functions ?? FirebaseFunctions.instanceFor(region: kFunctionsRegion);

  final FirebaseFunctions _functions;

  /// Pending invitations + accepted assignments of the signed-in user.
  Future<Result<StaffAccess>> getMyAccess() async {
    try {
      final response = await _functions
          .httpsCallable('getMyStaffAccess')
          .call<dynamic>();
      final data = Map<String, dynamic>.from(response.data as Map);

      List<Map<String, dynamic>> maps(Object? raw) => [
        for (final item in (raw as List<dynamic>? ?? const []))
          Map<String, dynamic>.from(item as Map),
      ];

      return Result.success(
        StaffAccess(
          invitations: maps(
            data['invitations'],
          ).map(StaffInvitation.fromMap).toList(),
          assignments: maps(
            data['assignments'],
          ).map(StaffAssignment.fromMap).toList(),
        ),
      );
    } on FirebaseFunctionsException catch (e) {
      debugPrint('getMyStaffAccess: ${e.code} ${e.message}');
      return Result.failure(_failure(e));
    } catch (e, stackTrace) {
      debugPrint('getMyStaffAccess error: $e\n$stackTrace');
      return Result.failure(
        FirebaseFailure('Something went wrong, please try again'),
      );
    }
  }

  Future<Result<void>> respond({
    required String eventId,
    required bool accept,
  }) async {
    try {
      await _functions.httpsCallable('respondToStaffInvite').call<dynamic>({
        'eventId': eventId,
        'accept': accept,
      });
      return const Result.success(null);
    } on FirebaseFunctionsException catch (e) {
      debugPrint('respondToStaffInvite: ${e.code} ${e.message}');
      return Result.failure(_failure(e));
    } catch (e, stackTrace) {
      debugPrint('respondToStaffInvite error: $e\n$stackTrace');
      return Result.failure(
        FirebaseFailure('Something went wrong, please try again'),
      );
    }
  }

  Failure _failure(FirebaseFunctionsException e) {
    switch (e.code) {
      case 'unauthenticated':
        return FirebaseFailure('You must be logged in');
      case 'unavailable':
      case 'deadline-exceeded':
        return FirebaseFailure('Service unavailable, check your connection');
      case 'not-found':
        // Also what the SDK reports when the function isn't deployed yet.
        return FirebaseFailure(e.message ?? 'Invitation not found');
      case 'failed-precondition':
      case 'invalid-argument':
      case 'permission-denied':
        return FirebaseFailure(e.message ?? 'Request was rejected');
      default:
        return FirebaseFailure('Something went wrong, please try again');
    }
  }
}

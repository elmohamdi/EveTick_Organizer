import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_staff/data/models/event_staff_member.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';

abstract class EventStaffRepository {
  Future<Result<List<EventStaffMember>>> getStaff(String eventId);

  /// Creates a pending invitation. Fails when the email is the organizer's
  /// own or was already invited to this event.
  Future<Result<EventStaffMember>> inviteStaff({
    required String eventId,
    required String name,
    required String email,
    required StaffRole role,
    required Set<StaffPermission> permissions,
  });

  /// Removes an active member or cancels a pending invitation.
  Future<Result<void>> removeStaff({
    required String eventId,
    required String staffId,
  });
}

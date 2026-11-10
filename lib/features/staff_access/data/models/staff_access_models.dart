import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';

Set<StaffPermission> _parsePermissions(Object? raw) {
  final permissions = <StaffPermission>{};
  if (raw is Map) {
    raw.forEach((key, value) {
      final permission = StaffPermission.fromKey(key.toString());
      if (permission != null && value == true) permissions.add(permission);
    });
  }
  return permissions;
}

/// An invitation sent to the signed-in user's e-mail, not answered yet.
class StaffInvitation {
  const StaffInvitation({
    required this.eventId,
    required this.eventTitle,
    required this.inviterName,
    required this.role,
    required this.permissions,
    this.coverImageUrl,
  });

  final String eventId;
  final String eventTitle;
  final String inviterName;
  final StaffRole role;
  final Set<StaffPermission> permissions;
  final String? coverImageUrl;

  factory StaffInvitation.fromMap(Map<String, dynamic> map) {
    return StaffInvitation(
      eventId: map['eventId'] as String? ?? '',
      eventTitle: map['eventTitle'] as String? ?? 'Untitled event',
      inviterName: map['inviterName'] as String? ?? 'An organizer',
      role: StaffRole.fromKey(map['role'] as String?),
      permissions: _parsePermissions(map['permissions']),
      coverImageUrl: map['coverImageUrl'] as String?,
    );
  }
}

/// An event the signed-in user works on as (accepted) staff.
class StaffAssignment {
  const StaffAssignment({
    required this.event,
    required this.role,
    required this.permissions,
  });

  /// Event summary in the same shape the "My Events" list already uses
  /// (`eventId`, `eventTitle`, `coverImageUrl`, `startAt`, `status`, ...).
  final Map<String, dynamic> event;
  final StaffRole role;
  final Set<StaffPermission> permissions;

  String get eventId => event['eventId'] as String? ?? '';

  bool can(StaffPermission permission) => permissions.contains(permission);

  factory StaffAssignment.fromMap(Map<String, dynamic> map) {
    return StaffAssignment(
      event: Map<String, dynamic>.from(map['event'] as Map),
      role: StaffRole.fromKey(map['role'] as String?),
      permissions: _parsePermissions(map['permissions']),
    );
  }
}

class StaffAccess {
  const StaffAccess({
    this.invitations = const [],
    this.assignments = const [],
  });

  final List<StaffInvitation> invitations;
  final List<StaffAssignment> assignments;
}

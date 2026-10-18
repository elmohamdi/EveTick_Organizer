import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';

enum StaffInviteStatus { pending, active }

class EventStaffMember {
  const EventStaffMember({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.permissions,
    required this.status,
  });

  /// The lower-cased email. It is also the document id, which is what
  /// guarantees one invitation per email per event.
  final String id;
  final String name;
  final String email;
  final StaffRole role;
  final Set<StaffPermission> permissions;
  final StaffInviteStatus status;

  bool get isPending => status == StaffInviteStatus.pending;

  factory EventStaffMember.fromMap(String id, Map<String, dynamic> map) {
    final rawPermissions = map['permissions'];
    final permissions = <StaffPermission>{};
    if (rawPermissions is Map) {
      rawPermissions.forEach((key, value) {
        final permission = StaffPermission.fromKey(key.toString());
        if (permission != null && value == true) permissions.add(permission);
      });
    }

    return EventStaffMember(
      id: id,
      name: (map['name'] as String?) ?? '',
      email: (map['email'] as String?) ?? id,
      role: StaffRole.fromKey(map['role'] as String?),
      permissions: permissions,
      status: map['status'] == 'active'
          ? StaffInviteStatus.active
          : StaffInviteStatus.pending,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role.key,
      'permissions': {
        for (final permission in StaffPermission.values)
          permission.key: permissions.contains(permission),
      },
      'status': isPending ? 'pending' : 'active',
    };
  }
}

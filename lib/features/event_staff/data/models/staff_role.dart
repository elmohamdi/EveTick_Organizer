import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';

/// A role is only a preset: picking one pre-fills the permissions, which can
/// then be adjusted. The permissions are what actually gets enforced.
enum StaffRole {
  coOrganizer('coOrganizer', {
    StaffPermission.viewAnalytics,
    StaffPermission.scanTickets,
    StaffPermission.editEventDetails,
  }),
  manager('manager', {
    StaffPermission.viewAnalytics,
    StaffPermission.scanTickets,
  }),
  gateStaff('gateStaff', {StaffPermission.scanTickets}),
  analyst('analyst', {StaffPermission.viewAnalytics});

  const StaffRole(this.key, this.defaultPermissions);

  final String key;
  final Set<StaffPermission> defaultPermissions;

  static StaffRole fromKey(String? key) {
    return values.firstWhere(
      (role) => role.key == key,
      orElse: () => StaffRole.gateStaff,
    );
  }
}

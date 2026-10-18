/// What a staff member is allowed to do on one event.
///
/// Stored in Firestore as `permissions: { <key>: true|false }` so security
/// rules can check them directly. To add a permission, add a value here and
/// a label in `staff_labels.dart`: the invite sheet and the staff tile are
/// generated from this enum.
enum StaffPermission {
  viewAnalytics('viewAnalytics'),
  scanTickets('scanTickets'),
  editEventDetails('editEventDetails');

  const StaffPermission(this.key);

  final String key;

  static StaffPermission? fromKey(String key) {
    for (final permission in values) {
      if (permission.key == key) return permission;
    }
    return null;
  }
}

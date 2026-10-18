import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';
import 'package:flutter/material.dart';

extension StaffPermissionLabels on StaffPermission {
  String get title => switch (this) {
    StaffPermission.viewAnalytics => 'Can view analytics',
    StaffPermission.scanTickets => 'Can scan tickets',
    StaffPermission.editEventDetails => 'Can edit event details',
  };

  String get description => switch (this) {
    StaffPermission.viewAnalytics => 'Access to sales reports and charts',
    StaffPermission.scanTickets => 'Use the mobile app for check-ins',
    StaffPermission.editEventDetails => 'Change title, schedule and description',
  };

  IconData get icon => switch (this) {
    StaffPermission.viewAnalytics => Icons.bar_chart_rounded,
    StaffPermission.scanTickets => Icons.qr_code_scanner_rounded,
    StaffPermission.editEventDetails => Icons.edit_outlined,
  };
}

extension StaffRoleLabels on StaffRole {
  String get label => switch (this) {
    StaffRole.coOrganizer => 'Co-organizer',
    StaffRole.manager => 'Manager',
    StaffRole.gateStaff => 'Gate Staff',
    StaffRole.analyst => 'Analyst',
  };
}

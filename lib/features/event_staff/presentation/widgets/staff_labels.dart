import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension StaffPermissionLabels on StaffPermission {
  String title(AppLocalizations l10n) => switch (this) {
    StaffPermission.viewAnalytics => l10n.staffPermissionViewAnalytics,
    StaffPermission.scanTickets => l10n.staffPermissionScanTickets,
    StaffPermission.editEventDetails => l10n.staffPermissionEditEventDetails,
  };

  String description(AppLocalizations l10n) => switch (this) {
    StaffPermission.viewAnalytics => l10n.staffPermissionViewAnalyticsDescription,
    StaffPermission.scanTickets => l10n.staffPermissionScanTicketsDescription,
    StaffPermission.editEventDetails => l10n.staffPermissionEditEventDetailsDescription,
  };

  IconData get icon => switch (this) {
    StaffPermission.viewAnalytics => Icons.bar_chart_rounded,
    StaffPermission.scanTickets => Icons.qr_code_scanner_rounded,
    StaffPermission.editEventDetails => Icons.edit_outlined,
  };
}

extension StaffRoleLabels on StaffRole {
  String label(AppLocalizations l10n) => switch (this) {
    StaffRole.coOrganizer => l10n.staffRoleCoOrganizer,
    StaffRole.manager => l10n.staffRoleManager,
    StaffRole.gateStaff => l10n.staffRoleGateStaff,
    StaffRole.analyst => l10n.staffRoleAnalyst,
  };
}

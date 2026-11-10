import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/notifications/presentation/widgets/notifications_app_bar.dart';
import 'package:evetick_organizer/features/notifications/presentation/widgets/notifications_body.dart';
import 'package:flutter/material.dart';

/// Needs a `NotificationsCubit`, a `StaffInvitesCubit` and a
/// `PendingEventsCubit` above it (provided by the router from
/// `NotificationsRouteArgs`).
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      appBar: const NotificationsAppBar(),
      body: const NotificationsBody(),
    );
  }
}

import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';

/// The cubits `MainContainer` owns, handed to the Notifications screen (it is
/// pushed on the root navigator, above `MainContainer`'s providers).
class NotificationsRouteArgs {
  const NotificationsRouteArgs({
    required this.notificationsCubit,
    required this.staffInvitesCubit,
    required this.pendingEventsCubit,
  });

  final NotificationsCubit notificationsCubit;
  final StaffInvitesCubit staffInvitesCubit;
  final PendingEventsCubit pendingEventsCubit;
}

import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:evetick_organizer/features/notifications/presentation/models/notifications_route_args.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bell with an unread badge (unread notifications + pending staff
/// invitations). Needs a [NotificationsCubit], a [StaffInvitesCubit] and a
/// [PendingEventsCubit] above it.
class NotificationBellButton extends StatelessWidget {
  const NotificationBellButton({super.key});

  void _open(BuildContext context) {
    final invitesCubit = context.read<StaffInvitesCubit>();
    // An invitation sent while the app was open shows up as soon as the
    // screen opens.
    invitesCubit.load();

    context.pushNamed(
      Routes.notificationsScreen,
      arguments: NotificationsRouteArgs(
        notificationsCubit: context.read<NotificationsCubit>(),
        staffInvitesCubit: invitesCubit,
        pendingEventsCubit: context.read<PendingEventsCubit>(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final unread = context.select(
      (NotificationsCubit cubit) => cubit.state.unreadCount,
    );
    final invitations = context.select(
      (StaffInvitesCubit cubit) => cubit.state.invitations.length,
    );
    final count = unread + invitations;

    return IconButton(
      tooltip: AppLocalizations.of(context)!.notificationsTitle,
      onPressed: () => _open(context),
      icon: Badge(
        isLabelVisible: count > 0,
        label: Text(count > 9 ? '9+' : '$count'),
        backgroundColor: ColorsManager.orange,
        textColor: ColorsManager.defaultWhite,
        child: Icon(
          Icons.notifications_none_rounded,
          size: 26.sp,
          color: context.colors.white,
        ),
      ),
    );
  }
}

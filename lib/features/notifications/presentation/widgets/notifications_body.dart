import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/notifications/data/models/app_notification.dart';
import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_state.dart';
import 'package:evetick_organizer/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:evetick_organizer/features/notifications/presentation/widgets/notifications_empty_state.dart';
import 'package:evetick_organizer/features/notifications/presentation/widgets/notifications_error_view.dart';
import 'package:evetick_organizer/features/notifications/presentation/widgets/notifications_invitations_section.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Invitations on top, then the notifications feed.
///
/// The two sources are independent on purpose: if the notifications listener
/// fails (rules / functions not deployed, offline), pending invitations must
/// still be answerable.
class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  void _onTap(BuildContext context, AppNotification notification) {
    context.read<NotificationsCubit>().markAsRead(notification);
    if (notification.eventId.isNotEmpty) {
      context.pushNamed(
        Routes.eventDashboardScreen,
        arguments: notification.eventId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final notificationsState = context.watch<NotificationsCubit>().state;
    final invitesState = context.watch<StaffInvitesCubit>().state;
    final hasInvitations = invitesState.invitations.isNotEmpty;

    return RefreshIndicator(
      color: ColorsManager.orange,
      backgroundColor: context.colors.lightBlue,
      // The notifications list is live; only invitations need a manual check.
      onRefresh: () => context.read<StaffInvitesCubit>().load(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: NotificationsInvitationsSection(
              state: invitesState,
              onAccepted: () =>
                  context.read<PendingEventsCubit>().getPendingEvents(),
            ),
          ),
          ..._feedSlivers(
            context,
            state: notificationsState,
            hasInvitations: hasInvitations,
          ),
        ],
      ),
    );
  }

  List<Widget> _feedSlivers(
    BuildContext context, {
    required NotificationsState state,
    required bool hasInvitations,
  }) {
    final notifications = state.notifications;

    if (notifications.isEmpty) {
      switch (state.status) {
        case NotificationsStatus.initial:
        case NotificationsStatus.loading:
          return [
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(color: ColorsManager.orange),
              ),
            ),
          ];
        case NotificationsStatus.failure:
          return [
            SliverFillRemaining(
              hasScrollBody: false,
              child: NotificationsErrorView(
                onRetry: () => context.read<NotificationsCubit>().start(),
              ),
            ),
          ];
        case NotificationsStatus.success:
          // Pending invitations already fill the screen: no "empty" message.
          if (hasInvitations) return const [];
          return const [
            SliverFillRemaining(
              hasScrollBody: false,
              child: NotificationsEmptyState(),
            ),
          ];
      }
    }

    final bottomInset = MediaQuery.paddingOf(context).bottom + 16.h;
    return [
      if (hasInvitations)
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
            child: Text(
              AppLocalizations.of(context)!.notificationsRecentTitle,
              style: TextStyles.font18WhiteBold(context),
            ),
          ),
        ),
      SliverPadding(
        padding: EdgeInsets.fromLTRB(
          16.w,
          hasInvitations ? 12.h : 8.h,
          16.w,
          bottomInset,
        ),
        sliver: SliverList.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return NotificationTile(
              notification: notification,
              onTap: () => _onTap(context, notification),
            );
          },
        ),
      ),
    ];
  }
}

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_state.dart';
import 'package:evetick_organizer/features/staff_access/presentation/widgets/check_failed.dart';
import 'package:evetick_organizer/features/staff_access/presentation/widgets/invitation_tile.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Pending staff invitations, with Accept / Decline. They live here (not in
/// "My Events") because they are something to act on, like a notification.
/// Requires a [StaffInvitesCubit] above it.
class NotificationsInvitationsSection extends StatelessWidget {
  const NotificationsInvitationsSection({
    super.key,
    required this.state,
    required this.onAccepted,
  });

  final StaffInvitesState state;

  /// Called after an invitation was accepted, so the events list can reload
  /// (the new event now belongs to it).
  final VoidCallback onAccepted;

  @override
  Widget build(BuildContext context) {
    if (state.invitations.isEmpty) {
      if (state.status != StaffInvitesStatus.failure) {
        return const SizedBox.shrink();
      }
      return CheckFailed(
        message: state.errorMessage,
        onRetry: () => context.read<StaffInvitesCubit>().load(),
      );
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(
              context,
            )!.staffInvitationsTitle(state.invitations.length),
            style: TextStyles.font18WhiteBold(context),
          ),
          verticalSpace(12),
          for (final invitation in state.invitations) ...[
            InvitationTile(
              invitation: invitation,
              isBusy: state.respondingIds.contains(invitation.eventId),
              onAccepted: onAccepted,
            ),
            verticalSpace(12),
          ],
        ],
      ),
    );
  }
}

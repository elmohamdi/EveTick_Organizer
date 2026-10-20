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

/// Pending staff invitations of the signed-in user, shown on top of "My Events".
/// Requires a [StaffInvitesCubit] above it.
class StaffInvitesBanner extends StatelessWidget {
  const StaffInvitesBanner({super.key, required this.onAccepted});

  /// Called after an invitation was accepted, so the screen can reload the
  /// events list (the new event now belongs to it).
  final VoidCallback onAccepted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffInvitesCubit, StaffInvitesState>(
      builder: (context, state) {
        if (state.status == StaffInvitesStatus.failure &&
            state.invitations.isEmpty) {
          return CheckFailed(
            message: state.errorMessage,
            onRetry: () => context.read<StaffInvitesCubit>().load(),
          );
        }
        if (state.invitations.isEmpty) return const SizedBox.shrink();

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.42,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
            children: [
              Text(
                AppLocalizations.of(context)!.staffInvitationsTitle(
                  state.invitations.length,
                ),
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
      },
    );
  }
}

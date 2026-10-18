import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/staff_labels.dart';
import 'package:evetick_organizer/features/staff_access/data/models/staff_access_models.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_state.dart';
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
          return _CheckFailed(
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
                'Staff invitations (${state.invitations.length})',
                style: TextStyles.font18WhiteBold(context),
              ),
              verticalSpace(12),
              for (final invitation in state.invitations) ...[
                _InvitationTile(
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

class _InvitationTile extends StatelessWidget {
  const _InvitationTile({
    required this.invitation,
    required this.isBusy,
    required this.onAccepted,
  });

  final StaffInvitation invitation;
  final bool isBusy;
  final VoidCallback onAccepted;

  Future<void> _respond(BuildContext context, {required bool accept}) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = await context.read<StaffInvitesCubit>().respond(
      invitation,
      accept: accept,
    );

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          error ??
              (accept
                  ? 'You joined "${invitation.eventTitle}"'
                  : 'Invitation declined'),
        ),
      ),
    );
    if (error == null && accept) onAccepted();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.orange.withAlpha(150)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            invitation.eventTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16WhiteMid(context),
          ),
          verticalSpace(4),
          Text(
            '${invitation.inviterName} invited you as ${invitation.role.label}',
            style: TextStyles.font14LightGrayRegular(context),
          ),
          if (invitation.permissions.isNotEmpty) ...[
            verticalSpace(10),
            Wrap(
              spacing: 8.w,
              runSpacing: 6.h,
              children: [
                for (final permission in invitation.permissions)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.darkBlue,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          permission.icon,
                          size: 14.sp,
                          color: ColorsManager.orange,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          permission.title.replaceFirst('Can ', ''),
                          style: TextStyles.font12LightGrayRegular(context),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
          verticalSpace(14),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: isBusy
                      ? null
                      : () => _respond(context, accept: false),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: context.colors.lightGray,
                    side: BorderSide(color: context.colors.lightGray),
                    minimumSize: Size.fromHeight(44.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: const Text('Decline'),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: isBusy
                      ? null
                      : () => _respond(context, accept: true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.orange,
                    foregroundColor: ColorsManager.defaultWhite,
                    minimumSize: Size.fromHeight(44.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: isBusy
                      ? SizedBox(
                          width: 18.w,
                          height: 18.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: ColorsManager.defaultWhite,
                          ),
                        )
                      : const Text('Accept'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CheckFailed extends StatelessWidget {
  const _CheckFailed({required this.message, required this.onRetry});

  final String? message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              message ?? "Couldn't check your invitations",
              style: TextStyles.font12LightGrayRegular(context),
            ),
          ),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

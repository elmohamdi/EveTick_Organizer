import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast_type.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/staff_labels.dart';
import 'package:evetick_organizer/features/staff_access/data/models/staff_access_models.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvitationTile extends StatelessWidget {
  const InvitationTile({
    super.key,
    required this.invitation,
    required this.isBusy,
    required this.onAccepted,
  });

  final StaffInvitation invitation;
  final bool isBusy;
  final VoidCallback onAccepted;

  Future<void> _respond(BuildContext context, {required bool accept}) async {
    // Taken before the await: once the invitation is answered this tile is
    // removed from the list and its context is no longer usable.
    final overlay = Overlay.of(context, rootOverlay: true);
    final l10n = AppLocalizations.of(context)!;
    final error = await context.read<StaffInvitesCubit>().respond(
      invitation,
      accept: accept,
    );

    AppToast.showOn(
      overlay,
      message:
          error ??
          (accept
              ? l10n.staffInvitationAccepted(invitation.eventTitle)
              : l10n.staffInvitationDeclined),
      type: error != null
          ? AppToastType.error
          : (accept ? AppToastType.success : AppToastType.info),
    );
    if (error == null && accept) onAccepted();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
            l10n.staffInvitationInvitedAs(
              invitation.inviterName,
              invitation.role.label(l10n),
            ),
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
                          permission.title(l10n),
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
                  child: Text(l10n.staffDecline),
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
                      : Text(l10n.staffAccept),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

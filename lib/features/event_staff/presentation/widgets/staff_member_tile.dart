import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/event_staff/data/models/event_staff_member.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/staff_labels.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffMemberTile extends StatelessWidget {
  const StaffMemberTile({
    super.key,
    required this.member,
    required this.isRemoving,
    required this.onRemove,
  });

  final EventStaffMember member;
  final bool isRemoving;
  final VoidCallback onRemove;

  String get _initial =>
      member.name.trim().isEmpty ? '?' : member.name.trim()[0].toUpperCase();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.orange.withValues(alpha: 0.15),
            ),
            child: Text(_initial, style: TextStyles.font16OrangeRegular),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font16WhiteMid(context),
                ),
                verticalSpace(2),
                Text(
                  member.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font12LightGrayRegular(context),
                ),
                verticalSpace(10),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _Pill(
                      label: member.role.label(l10n).toUpperCase(),
                      color: context.colors.gray3.withValues(alpha: 0.5),
                    ),
                    _Pill(
                      label: member.isPending ? l10n.staffPending : l10n.staffActive,
                      color: member.isPending
                          ? context.colors.gray3.withValues(alpha: 0.5)
                          : ColorsManager.confirmed,
                    ),
                    for (final permission in StaffPermission.values)
                      if (member.permissions.contains(permission))
                        Tooltip(
                          message: permission.title(l10n),
                          child: Icon(
                            permission.icon,
                            size: 18.sp,
                            color: context.colors.lightGray,
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
          horizontalSpace(4),
          if (isRemoving)
            Padding(
              padding: EdgeInsets.all(10.w),
              child: SizedBox(
                width: 20.w,
                height: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: ColorsManager.orange,
                ),
              ),
            )
          else
            IconButton(
              onPressed: onRemove,
              tooltip: member.isPending
                  ? l10n.staffCancelInvitation
                  : l10n.staffRemove,
              icon: Icon(
                Icons.delete_outline_rounded,
                size: 22.sp,
                color: context.colors.gray3,
              ),
            ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyles.font12Gray3Mid.copyWith(
          color: context.colors.white,
          fontSize: 10.sp,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

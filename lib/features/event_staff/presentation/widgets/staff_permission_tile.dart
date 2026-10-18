import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/staff_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffPermissionTile extends StatelessWidget {
  const StaffPermissionTile({
    super.key,
    required this.permission,
    required this.isSelected,
    required this.onChanged,
  });

  final StaffPermission permission;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onChanged(!isSelected),
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: context.colors.lightBlue,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isSelected
                  ? ColorsManager.orange
                  : context.colors.secondaryBlue.withValues(alpha: 0.25),
              width: isSelected ? 1.3 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      permission.title,
                      style: TextStyles.font16WhiteMid(context),
                    ),
                    verticalSpace(4),
                    Text(
                      permission.description,
                      style: TextStyles.font12LightGrayRegular(context),
                    ),
                  ],
                ),
              ),
              horizontalSpace(12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 26.w,
                height: 26.w,
                decoration: BoxDecoration(
                  color: isSelected ? ColorsManager.orange : Colors.transparent,
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    color: isSelected
                        ? ColorsManager.orange
                        : context.colors.gray3,
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? Icon(
                        Icons.check_rounded,
                        size: 18.sp,
                        color: ColorsManager.defaultWhite,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

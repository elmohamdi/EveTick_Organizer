import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanToggleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const ScanToggleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: context.colors.lightGray,
            size: 20.sp,
          ),
          horizontalSpace(8),
          Text(
            title,
            style: TextStyle(
              color: context.colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Transform.scale(
            scale: 0.82,
            child: Switch(
              value: isEnabled,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: ColorsManager.orange,
              inactiveThumbColor: context.colors.lightGray,
              inactiveTrackColor:
                  context.colors.secondaryBlue.withValues(alpha: 0.4),
              trackOutlineColor:
                  const WidgetStatePropertyAll(Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}

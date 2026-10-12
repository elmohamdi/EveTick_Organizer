import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanHeaderAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFlashOn;
  final VoidCallback? onFlashToggle;
  final VoidCallback? onBackPressed;

  const ScanHeaderAppBar({
    super.key,
    this.title = 'Scan Tickets',
    this.subtitle = 'Summer Music Festival 2024',
    this.isFlashOn = false,
    this.onFlashToggle,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onBackPressed ?? () => Navigator.of(context).maybePop(),
            borderRadius: BorderRadius.circular(22.r),
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.secondaryBlue.withValues(alpha: 0.6),
                border: Border.all(
                  color: context.colors.secondaryBlue.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: context.colors.white,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ),

        // Center Title and Subtitle
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.font18WhiteBold(context),
              ),
              verticalSpace(2),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: context.colors.lightGray,
                ),
              ),
            ],
          ),
        ),

        // Flashlight Toggle Button
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onFlashToggle,
            borderRadius: BorderRadius.circular(22.r),
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isFlashOn
                    ? ColorsManager.orange.withValues(alpha: 0.25)
                    : context.colors.secondaryBlue.withValues(alpha: 0.6),
                border: Border.all(
                  color: isFlashOn
                      ? ColorsManager.orange
                      : context.colors.secondaryBlue.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Center(
                child: Icon(
                  isFlashOn ? Icons.flash_on_rounded : Icons.flash_on_rounded,
                  color: isFlashOn ? ColorsManager.orange : context.colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

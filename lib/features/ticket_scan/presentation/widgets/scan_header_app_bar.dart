import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class ScanHeaderAppBar extends StatelessWidget {
  final String? title;
  final String subtitle;
  final bool isFlashOn;

  /// `null` disables the flash button (e.g. the device has no torch).
  final VoidCallback? onFlashToggle;

  /// When set, the subtitle becomes tappable (used to switch the event).
  final VoidCallback? onSubtitleTap;

  const ScanHeaderAppBar({
    super.key,
    this.title,
    required this.subtitle,
    this.isFlashOn = false,
    this.onFlashToggle,
    this.onSubtitleTap,
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
            ),
          ),
        ),

        // Center Title and Subtitle
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? AppLocalizations.of(context)!.scanTitle,
                textAlign: TextAlign.center,
                style: TextStyles.font18WhiteBold(context),
              ),
              verticalSpace(2),
              InkWell(
                onTap: onSubtitleTap,
                borderRadius: BorderRadius.circular(8.r),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: context.colors.lightGray,
                        ),
                      ),
                    ),
                    if (onSubtitleTap != null)
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18.sp,
                        color: context.colors.lightGray,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Flashlight Toggle Button
        Opacity(
          opacity: onFlashToggle == null ? 0.4 : 1,
          child: Material(
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
                    isFlashOn
                        ? Icons.flash_on_rounded
                        : Icons.flash_off_rounded,
                    color: isFlashOn
                        ? ColorsManager.orange
                        : context.colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

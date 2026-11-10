import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Full-width orange button with white text in both themes.
class SupportPrimaryButton extends StatelessWidget {
  const SupportPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.orange,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(
          height: 52.h,
          width: double.infinity,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 22.w,
                    height: 22.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: ColorsManager.defaultWhite,
                    ),
                  )
                : Text(
                    label,
                    style: TextStyles.font16WhiteBold(
                      context,
                    ).copyWith(color: ColorsManager.defaultWhite),
                  ),
          ),
        ),
      ),
    );
  }
}

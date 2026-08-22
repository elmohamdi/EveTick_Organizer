import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlineAppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final VoidCallback onPressed;
  final Widget? trailing;
  const OutlineAppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    required this.onPressed,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth ?? 344.w, buttonHeight ?? 48.h),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: borderColor ?? ColorsManager.orange, width: 1.5),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(buttonText, style: textStyle ?? TextStyles.font16OrangeRegular),
          if (trailing != null)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: trailing,
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledAppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final VoidCallback onPressed;
  final Color? textColor;
  const FilledAppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.buttonWidth,
    this.buttonHeight,
    this.textColor,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorsManager.orange,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth ?? 344.w, buttonHeight ?? 48.h),
        ),
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: TextStyles.font16WhiteMid(context)),
    );
  }
}

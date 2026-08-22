import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DigitVerificationCodeFrame extends StatelessWidget {
  const DigitVerificationCodeFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialPinField(
      length: 4,
      hintCharacter: '-'  ,
      hintStyle: TextStyles.font18WhiteBold(context),
      theme: MaterialPinTheme(
        shape: MaterialPinShape.outlined,
        cellSize: Size(48.w, 60.h),
        borderRadius: BorderRadius.circular(12.0),
        fillColor: ColorsManager.fourthBlue,
        borderColor: ColorsManager.darkGray,
        focusedBorderColor: ColorsManager.orange,
        focusedFillColor: ColorsManager.fourthBlue,
        completeFillColor: ColorsManager.fourthBlue,
        completeBorderColor: ColorsManager.orange,
        filledFillColor: ColorsManager.fourthBlue,
        filledBorderColor: ColorsManager.orange,
        borderWidth: 2,
        textStyle: TextStyles.font18WhiteBold(context),

        spacing: 16,
      ),
    );
  }
}
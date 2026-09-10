import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font18DarkBlueBold(BuildContext context) => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.white,
  );

  static TextStyle font24WhiteBold(BuildContext context) => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.white,
  );

  static TextStyle font16LightGrayRegular(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: context.colors.lightGray,
  );
  static TextStyle font14LightGrayRegular(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: context.colors.lightGray,
  );

  static TextStyle font16WhiteMid(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: context.colors.white,
  );
  static TextStyle font16DarkBlueMid(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: context.colors.darkBlue,
  );
  static TextStyle font16RedMid = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.red,
  );

  static TextStyle font16lightGrayMid(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: context.colors.lightGray,
  );

  static TextStyle font16WhiteRegular(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: context.colors.white,
  );

  static TextStyle font16LightGrayMid(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: context.colors.lightGray,
  );

  static TextStyle font18WhiteBold(BuildContext context) => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.white,
  );
  static TextStyle font16WhiteBold(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: context.colors.white,
  );
  static TextStyle font12LightGrayRegular(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: context.colors.lightGray,
  );

  static TextStyle font12OrangeBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.orange,
  );

  static TextStyle font12OrangeMid = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.orange,
  );

  static TextStyle font16OrangeRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.orange,
  );
  static TextStyle font24OrangeBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.orange,
  );
  static TextStyle font14IndicatorLabel(BuildContext context, Color color) =>
      TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.bold,
        color: color,
      );
}

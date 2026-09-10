import 'package:evetick_organizer/core/theming/app_colors.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:flutter/material.dart';

const lightAppColors = AppColors(
  white: ColorsManager.darkBlue,
  lightGray: ColorsManager.darkGray,
  darkGray: ColorsManager.lightGray,
  secondaryBlue: ColorsManager.gray2,
  lightBlue: ColorsManager.defaultWhite,
  thirdBlue: ColorsManager.defaultWhite,
  textBackground: ColorsManager.lightGray,
  hotBackground: ColorsManager.defaultWhite,
  darkBlue: ColorsManager.white,
  black: Colors.black,
  fourthBlue: Colors.white,
  gray3: ColorsManager.gray3,
);
final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorsManager.white,
  extensions: const [lightAppColors],
);

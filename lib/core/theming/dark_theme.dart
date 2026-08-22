import 'package:evetick_organizer/core/theming/app_colors.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:flutter/material.dart';

const darkAppColors = AppColors(
  white: ColorsManager.white,
  black: Colors.black,
  lightGray: ColorsManager.lightGray,
  darkGray: ColorsManager.darkGray,
  secondaryBlue: ColorsManager.secondryBlue,
  lightBlue: ColorsManager.lightBlue,
  thirdBlue: ColorsManager.thirdBlue,
  textBackground: ColorsManager.textBackround,
  hotBackground: ColorsManager.hotBackground,
  darkBlue: ColorsManager.darkBlue,
  fourthBlue: ColorsManager.fourthBlue,
);
final ThemeData darkThemeData = ThemeData(
  scaffoldBackgroundColor: ColorsManager.darkBlue,
  brightness: Brightness.dark,
  extensions: const [darkAppColors],
);

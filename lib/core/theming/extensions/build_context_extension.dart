import 'package:evetick_organizer/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

import 'package:evetick_organizer/core/theming/app_colors.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Time picker dialog that follows the app palette instead of Material's
/// default purple. Built from [AppColors] so it works in both dark and light.
TimePickerThemeData appTimePickerTheme(AppColors colors) {
  final fieldRadius = BorderRadius.circular(10);

  return TimePickerThemeData(
    backgroundColor: colors.lightBlue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    helpTextStyle: TextStyle(
      color: colors.lightGray,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    hourMinuteColor: colors.textBackground,
    hourMinuteTextColor: WidgetStateColor.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? ColorsManager.orange
          : colors.white,
    ),
    timeSelectorSeparatorColor: WidgetStatePropertyAll(colors.lightGray),
    dayPeriodColor: WidgetStateColor.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? ColorsManager.orange.withValues(alpha: 0.2)
          : Colors.transparent,
    ),
    dayPeriodTextColor: WidgetStateColor.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? ColorsManager.orange
          : colors.lightGray,
    ),
    dayPeriodBorderSide: BorderSide(color: colors.textBackground),
    dayPeriodShape: RoundedRectangleBorder(borderRadius: fieldRadius),
    // Used by the hour / minute text fields (input mode). Providing it
    // replaces Material's default, so every state is spelled out.
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: colors.textBackground,
      contentPadding: EdgeInsets.zero,
      hintStyle: TextStyle(color: colors.lightGray),
      errorStyle: const TextStyle(fontSize: 0, height: 0),
      enabledBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: const BorderSide(color: ColorsManager.orange, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: const BorderSide(color: ColorsManager.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: const BorderSide(color: ColorsManager.red, width: 2),
      ),
    ),
    cancelButtonStyle: TextButton.styleFrom(foregroundColor: colors.lightGray),
    confirmButtonStyle: TextButton.styleFrom(
      foregroundColor: ColorsManager.orange,
    ),
  );
}

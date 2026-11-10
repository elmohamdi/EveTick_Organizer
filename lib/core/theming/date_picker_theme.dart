import 'package:evetick_organizer/core/theming/app_colors.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Date picker dialog that follows the app palette instead of Material's
/// default purple. Built from [AppColors] so it works in dark and light.
DatePickerThemeData appDatePickerTheme(AppColors colors) {
  final fieldRadius = BorderRadius.circular(12);

  // Day / year cells: orange fill when selected, orange text for "today".
  Color? foreground(Set<WidgetState> states, {required bool isToday}) {
    if (states.contains(WidgetState.selected)) return ColorsManager.defaultWhite;
    if (states.contains(WidgetState.disabled)) {
      return colors.lightGray.withValues(alpha: 0.4);
    }
    return isToday ? ColorsManager.orange : colors.white;
  }

  Color? background(Set<WidgetState> states) =>
      states.contains(WidgetState.selected)
      ? ColorsManager.orange
      : Colors.transparent;

  return DatePickerThemeData(
    backgroundColor: colors.lightBlue,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    headerBackgroundColor: Colors.transparent,
    headerForegroundColor: colors.white,
    headerHelpStyle: TextStyle(
      color: colors.lightGray,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    weekdayStyle: TextStyle(
      color: colors.lightGray,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    dividerColor: colors.textBackground,
    dayForegroundColor: WidgetStateProperty.resolveWith(
      (states) => foreground(states, isToday: false),
    ),
    dayBackgroundColor: WidgetStateProperty.resolveWith(background),
    dayOverlayColor: WidgetStatePropertyAll(
      ColorsManager.orange.withValues(alpha: 0.12),
    ),
    todayForegroundColor: WidgetStateProperty.resolveWith(
      (states) => foreground(states, isToday: true),
    ),
    todayBackgroundColor: WidgetStateProperty.resolveWith(background),
    todayBorder: const BorderSide(color: ColorsManager.orange),
    yearForegroundColor: WidgetStateProperty.resolveWith(
      (states) => foreground(states, isToday: false),
    ),
    yearBackgroundColor: WidgetStateProperty.resolveWith(background),
    yearOverlayColor: WidgetStatePropertyAll(
      ColorsManager.orange.withValues(alpha: 0.12),
    ),
    // Text-entry mode (pencil icon). Replaces Material's default, so every
    // state is spelled out.
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.textBackground,
      labelStyle: TextStyle(color: colors.lightGray),
      floatingLabelStyle: const TextStyle(color: ColorsManager.orange),
      hintStyle: TextStyle(color: colors.lightGray),
      border: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: const BorderSide(color: ColorsManager.orange, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: const BorderSide(color: ColorsManager.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: const BorderSide(color: ColorsManager.red, width: 1.5),
      ),
    ),
    cancelButtonStyle: TextButton.styleFrom(foregroundColor: colors.lightGray),
    confirmButtonStyle: TextButton.styleFrom(
      foregroundColor: ColorsManager.orange,
    ),
  );
}

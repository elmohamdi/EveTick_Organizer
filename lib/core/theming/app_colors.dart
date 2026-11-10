import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color white;
  final Color lightGray;
  final Color darkGray;
  final Color secondaryBlue;
  final Color lightBlue;
  final Color thirdBlue;
  final Color textBackground;
  final Color hotBackground;
  final Color darkBlue;
  final Color black;
  final Color fourthBlue;
  final Color gray3;
  const AppColors({
    required this.darkBlue,
    required this.black,
    required this.white,
    required this.lightGray,
    required this.darkGray,
    required this.secondaryBlue,
    required this.lightBlue,
    required this.thirdBlue,
    required this.textBackground,
    required this.hotBackground,
    required this.fourthBlue,
    required this.gray3
  });

  @override
  AppColors copyWith({
    Color? white,
    Color? black,
    Color? lightGray,
    Color? darkGray,
    Color? secondaryBlue,
    Color? lightBlue,
    Color? thirdBlue,
    Color? textBackground,
    Color? hotBackground,
    Color? darkBlue,
    Color? fourthBlue,
    Color? gray3
  }) {
    return AppColors(
      darkBlue: darkBlue ?? this.darkBlue,
      white: white ?? this.white,
      lightGray: lightGray ?? this.lightGray,
      darkGray: darkGray ?? this.darkGray,
      secondaryBlue: secondaryBlue ?? this.secondaryBlue,
      lightBlue: lightBlue ?? this.lightBlue,
      thirdBlue: thirdBlue ?? this.thirdBlue,
      textBackground: textBackground ?? this.textBackground,
      hotBackground: hotBackground ?? this.hotBackground,
      black: black ?? this.black,
      gray3: gray3??this.gray3,
      fourthBlue: fourthBlue??this.fourthBlue,
      
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      white: Color.lerp(white, other.white, t)!,
      lightGray: Color.lerp(lightGray, other.lightGray, t)!,
      darkGray: Color.lerp(darkGray, other.darkGray, t)!,
      secondaryBlue: Color.lerp(secondaryBlue, other.secondaryBlue, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      thirdBlue: Color.lerp(thirdBlue, other.thirdBlue, t)!,
      textBackground: Color.lerp(textBackground, other.textBackground, t)!,
      hotBackground: Color.lerp(hotBackground, other.hotBackground, t)!,
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t)!,
      black: Color.lerp(black, other.black, t)!,
      fourthBlue: Color.lerp(fourthBlue, other.fourthBlue, t)!,
      gray3: Color.lerp(gray3, other.gray3, t)!,
    );
  }
}

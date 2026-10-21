import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The EveTick logo, switching between the dark and light versions with the
/// current theme.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SvgPicture.asset(
      isDark ? 'assets/svgs/dark_logo.svg' : 'assets/svgs/light_logo.svg',
    );
  }
}

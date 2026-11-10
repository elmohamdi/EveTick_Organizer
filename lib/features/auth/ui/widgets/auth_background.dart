import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/onboarding_background_image.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: context.colors.darkBlue.withValues(alpha: 0.09),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colors.darkBlue.withValues(alpha: 1),
                  context.colors.darkBlue.withValues(alpha: 0.8),
                  context.colors.darkBlue.withValues(alpha: 0.85),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

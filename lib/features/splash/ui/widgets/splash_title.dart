import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/splash/ui/widgets/splash_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashTitle extends StatelessWidget {
  final SplashAnimations animations;

  const SplashTitle({super.key, required this.animations});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final tickColor = isDark ? ColorsManager.white : ColorsManager.darkBlue;

    const spacing = 3.0;

    final baseStyle = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w800,
      letterSpacing: spacing,
      height: 1.1,
    );

    return AnimatedBuilder(
      animation: animations.controller,
      builder: (context, _) {
        return Transform.translate(
          offset: Offset(
            0,
            -22.h * animations.lift.value + animations.nameSlide.value,
          ),
          child: Opacity(
            opacity: animations.nameFade.value,
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, left: spacing),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'EVE',
                      style: baseStyle.copyWith(color: ColorsManager.orange),
                    ),
                    TextSpan(
                      text: 'TICK',
                      style: baseStyle.copyWith(color: tickColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
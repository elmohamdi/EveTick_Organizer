import 'package:evetick_organizer/features/splash/ui/widgets/splash_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashLogo extends StatelessWidget {
  final SplashAnimations animations;

  const SplashLogo({super.key, required this.animations});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoAsset =
        isDark ? 'assets/svgs/dark_logo.svg' : 'assets/svgs/light_logo.svg';

    return AnimatedBuilder(
      animation: animations.controller,
      builder: (context, _) {
        final lift = animations.lift.value;

        return Transform.translate(
          offset: Offset(0, -22.h * lift),
          child: Opacity(
            opacity: animations.fadeIn.value,
            child: Transform.rotate(
              angle: animations.entryTilt.value + animations.wiggle.value,
              child: Transform.scale(
                scale: animations.popScale.value * (1 - 0.12 * lift),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: SvgPicture.asset(logoAsset, width: 140.w),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

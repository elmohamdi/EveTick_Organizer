import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/image_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 650.h,
          child: Image.asset(
            'assets/images/welcome_background_image.png',
            fit: BoxFit.cover,
          ),
        ),
        ImageGradient(),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 100.h,
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, context.colors.darkBlue],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/or_devider.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/platform_container.dart';
import 'package:flutter/material.dart';

class LoginWithOtherPlatforms extends StatelessWidget {
  const LoginWithOtherPlatforms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrDevider(),
        verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: PlatformContainer(url: 'assets/svgs/google.svg'),
            ),
            horizontalSpace(32),
            InkWell(
              onTap: () {},
              child: PlatformContainer(url: 'assets/svgs/facebook.svg'),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/custom_indicator.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/image_gradient.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/onboarding1_image.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding1Screen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final int currentIndex;
  const Onboarding1Screen({
    super.key,
    required this.onNext,
    required this.onSkip,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            OnboardingBackGroungImage(),
            Positioned.fill(
              child: Container(
                color: context.colors.darkBlue.withValues(alpha: 0.09),
              ),
            ),
            ImageGradient(),
            Positioned(
              top: 136.h,
              left: 30.w,
              right: 30.w,
              child: Image.asset('assets/images/ticket_widget.png'),
            ),
            Positioned(
              top: 520.h,
              left: 16.w,
              right: 16.w,
              child: Text(
                AppLocalizations.of(context)!.onboardingCreateCustomize,
                style: TextStyles.font24WhiteBold(context),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 568.h,
              left: 16.w,
              right: 16.w,
              child: Text(
                AppLocalizations.of(
                  context,
                )!.onboardingCreateCustomizeDescription,
                style: TextStyles.font16LightGrayRegular(context),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 625.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIndicator(active: currentIndex == 0),
                  SizedBox(width: 5.w),
                  CustomIndicator(active: currentIndex == 1),
                  SizedBox(width: 5.w),
                  CustomIndicator(active: currentIndex == 2),
                ],
              ),
            ),
            Positioned(
              top: 50.h,
              left: 306.w,
              right: 16.w,
              bottom: 740.h,
              child: SizedBox(
                child: TextButton(
                  onPressed: onSkip,
                  child: Text(
                    AppLocalizations.of(context)!.commonSkip,
                    style: TextStyles.font14LightGrayRegular(context),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 665.h,
                bottom: 117.h,
              ),
              child: FilledAppTextButton(
                buttonText: AppLocalizations.of(context)!.commonNext,
                onPressed: onNext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

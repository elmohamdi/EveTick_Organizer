import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/custom_indicator.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/image_gradient.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/onboarding1_image.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding2Screen extends StatelessWidget {
  final VoidCallback onNext;
  final int currentIndex;
  const Onboarding2Screen({
    super.key,
    required this.onNext,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
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
            top: 124.h,
            left: 86.w,
            right: 90.w,
            child: Image.asset('assets/images/phone_widget.png'),
          ),
          Positioned(
            top: 525.h,
            left: 16.w,
            right: 16.w,
            child: Text(
              AppLocalizations.of(context)!.onboardingScanAndManage,
              style: TextStyles.font24WhiteBold(context),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 570.h,
            left: 16.w,
            right: 16.w,
            child: Text(
              AppLocalizations.of(context)!.onboardingScanningDescription,
              style: TextStyles.font16LightGrayRegular(context),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            top: 628.h,
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
          Padding(
            padding: EdgeInsets.only(top: 665.h, left: 16.w, right: 16.w),
            child: FilledAppTextButton(
              buttonText: AppLocalizations.of(context)!.commonNext,
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}

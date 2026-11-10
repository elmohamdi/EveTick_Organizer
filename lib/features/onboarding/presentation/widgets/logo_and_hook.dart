import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoAndHook extends StatelessWidget {
  const LogoAndHook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: Column(
        children: [
          Theme.of(context).brightness == Brightness.dark
              ? SvgPicture.asset('assets/svgs/dark_logo.svg')
              : SvgPicture.asset('assets/svgs/light_logo.svg'),

          verticalSpace(4),

          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                height: 1.4,
                color: context.colors.white,
              ),
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.onboardingWelcomeTitle,
                ),
                TextSpan(
                  text: AppLocalizations.of(
                    context,
                  )!.onboardingWelcomeTitleRemain,
                  style: TextStyle(color: ColorsManager.orange),
                ),
              ],
            ),
          ),

          verticalSpace(8),

          Text(
            AppLocalizations.of(context)!.onboardingWelcomeSubtitle,
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyles.font16LightGrayRegular(context),
          ),
        ],
      ),
    );
  }
}

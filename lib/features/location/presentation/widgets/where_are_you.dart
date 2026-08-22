import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WhereAreYou extends StatelessWidget {
  const WhereAreYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 116.w,
          height: 100.h,
          child: SvgPicture.asset('assets/svgs/setLocation.svg'),
        ),
        verticalSpace(45),
        Text(
          AppLocalizations.of(context)!.locationSetLocationTitle,
          style: TextStyles.font18WhiteBold(context),
        ),
        verticalSpace(16),
        Text(
          textAlign: TextAlign.center,
          AppLocalizations.of(context)!.onboardingLocationPermissionNotice,
          style: TextStyles.font16LightGrayRegular(context),
        ),
      ],
    );
  }
}

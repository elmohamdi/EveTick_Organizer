import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.bar_chart_rounded,
            size: 48.sp,
            color: context.colors.gray3,
          ),
          verticalSpace(12),
          Text(AppLocalizations.of(context)!.homeNoEventsTitle, style: TextStyles.font18WhiteBold(context)),
          verticalSpace(6),
          Text(
            AppLocalizations.of(context)!.homeNoEventsSubtitle,
            textAlign: TextAlign.center,
            style: TextStyles.font14LightGrayRegular(context),
          ),
        ],
      ),
    );
  }
}

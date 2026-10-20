import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_primary_button.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StillNeedHelpCard extends StatelessWidget {
  const StillNeedHelpCard({super.key, required this.onContactTap});

  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        children: [
          Text(
            l10n.supportStillNeedHelpTitle,
            textAlign: TextAlign.center,
            style: TextStyles.font18WhiteBold(context),
          ),
          verticalSpace(8),
          Text(
            l10n.supportStillNeedHelpSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              height: 1.5,
              color: context.colors.lightGray,
            ),
          ),
          verticalSpace(20),
          SupportPrimaryButton(
            label: l10n.supportContactSupport,
            onTap: onContactTap,
          ),
        ],
      ),
    );
  }
}

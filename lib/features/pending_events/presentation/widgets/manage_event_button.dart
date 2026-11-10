import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class ManageEventButton extends StatelessWidget {
  const ManageEventButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.orange,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          height: 44.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.dashboard_customize_outlined,
                size: 20.sp,
                color: ColorsManager.defaultWhite,
              ),
              horizontalSpace(8),
              Text(
                AppLocalizations.of(context)!.myEventsManageEvent,
                style: TextStyles.font16WhiteMid(
                  context,
                ).copyWith(color: ColorsManager.defaultWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqEmptyState extends StatelessWidget {
  const FaqEmptyState({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off_rounded, size: 48.sp, color: context.colors.gray3),
          verticalSpace(12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.font16WhiteMid(context),
          ),
          verticalSpace(6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.font14LightGrayRegular(context),
          ),
        ],
      ),
    );
  }
}

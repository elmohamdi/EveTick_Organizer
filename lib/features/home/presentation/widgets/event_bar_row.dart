import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One horizontal bar of the "Sales by Event" chart.
class EventBarRow extends StatelessWidget {
  const EventBarRow({
    super.key,
    required this.title,
    required this.valueLabel,
    required this.fraction,
    this.onTap,
  });

  final String title;
  final String valueLabel;

  /// 0.0 - 1.0, relative to the biggest bar in the chart.
  final double fraction;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font16WhiteMid(
                      context,
                    ).copyWith(fontSize: 14.sp),
                  ),
                ),
                horizontalSpace(8),
                Text(valueLabel, style: TextStyles.font14LightGrayRegular(context)),
              ],
            ),
            verticalSpace(8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Container(
                height: 8.h,
                width: double.infinity,
                alignment: AlignmentDirectional.centerStart,
                color: context.colors.textBackground,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: fraction),
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeOutCubic,
                  builder: (_, value, _) => FractionallySizedBox(
                    widthFactor: value,
                    child: const ColoredBox(color: ColorsManager.orange),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

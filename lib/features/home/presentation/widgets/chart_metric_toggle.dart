import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/home/presentation/models/home_chart_metric.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartMetricToggle extends StatelessWidget {
  const ChartMetricToggle({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final HomeChartMetric selected;
  final ValueChanged<HomeChartMetric> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: context.colors.textBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final metric in HomeChartMetric.values)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onChanged(metric),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: metric == selected
                      ? ColorsManager.orange
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  metric.label,
                  style: TextStyles.font12LightGrayRegular(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: metric == selected
                        ? ColorsManager.defaultWhite
                        : context.colors.lightGray,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

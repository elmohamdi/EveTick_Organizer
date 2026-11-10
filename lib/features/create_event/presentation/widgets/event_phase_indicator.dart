import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class EventPhaseIndicator extends StatelessWidget {
  final int currentStep;

  const EventPhaseIndicator({super.key, this.currentStep = 0});

  static List<String> labelsOf(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      l10n.createEventPhaseDetails,
      l10n.createEventPhaseMedia,
      l10n.createEventPhaseSeating,
      l10n.createEventPhaseTickets,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final labels = labelsOf(context);
    return Row(
      children: List.generate(labels.length, (index) {
        final bool isActive = index == currentStep;

        final Color color = isActive
            ? ColorsManager.orange
            : context.colors.gray3;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0.w : 4.w,
              right: index == labels.length - 1 ? 0.w : 4.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                verticalSpace(6),
                Text(
                  labels[index],
                  style: TextStyles.font14IndicatorLabel(context, color),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

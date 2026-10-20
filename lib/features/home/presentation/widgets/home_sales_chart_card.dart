import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';
import 'package:evetick_organizer/features/home/presentation/models/home_chart_metric.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/chart_metric_toggle.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/event_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

/// Top events ranked by revenue or tickets sold. Tapping a bar opens that
/// event's dashboard.
class HomeSalesChartCard extends StatefulWidget {
  const HomeSalesChartCard({super.key, required this.events});

  final List<EventDashboard> events;

  @override
  State<HomeSalesChartCard> createState() => _HomeSalesChartCardState();
}

class _HomeSalesChartCardState extends State<HomeSalesChartCard> {
  static const int _maxBars = 5;

  HomeChartMetric _metric = HomeChartMetric.revenue;

  @override
  Widget build(BuildContext context) {
    final ranked = [...widget.events]
      ..sort((a, b) => _metric.valueOf(b).compareTo(_metric.valueOf(a)));
    final top = ranked.take(_maxBars).toList();
    final maxValue = top.isEmpty ? 0.0 : _metric.valueOf(top.first);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.homeSalesByEvent,
                  style: TextStyles.font18WhiteBold(context),
                ),
              ),
              ChartMetricToggle(
                selected: _metric,
                onChanged: (metric) => setState(() => _metric = metric),
              ),
            ],
          ),
          verticalSpace(12),
          for (final event in top)
            EventBarRow(
              title: event.title,
              valueLabel: _metric.format(_metric.valueOf(event)),
              fraction: maxValue <= 0 ? 0 : _metric.valueOf(event) / maxValue,
              onTap: () => context.pushNamed(
                Routes.eventDashboardScreen,
                arguments: event.eventId,
              ),
            ),
        ],
      ),
    );
  }
}

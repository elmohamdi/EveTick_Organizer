import 'package:evetick_organizer/core/helpers/formatters.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/event_dashboard/presentation/widgets/dashboard_stat_card.dart';
import 'package:evetick_organizer/features/home/data/models/home_overview.dart';
import 'package:flutter/material.dart';

class HomeStatsGrid extends StatelessWidget {
  const HomeStatsGrid({super.key, required this.overview});

  final HomeOverview overview;

  @override
  Widget build(BuildContext context) {
    final soldPercent = (overview.sellThrough * 100).round();

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.payments_outlined,
                  label: 'REVENUE',
                  value: Formatters.money(overview.revenue),
                  valueColor: ColorsManager.orange,
                  caption: 'All events',
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.confirmation_number_outlined,
                  label: 'TICKETS SOLD',
                  value: Formatters.number(overview.ticketsSold),
                  caption:
                      '$soldPercent% of ${Formatters.number(overview.capacity)}',
                ),
              ),
            ],
          ),
        ),
        verticalSpace(12),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.event_outlined,
                  label: 'EVENTS',
                  value: Formatters.number(overview.totalEvents),
                  caption: '${Formatters.number(overview.liveEvents)} live now',
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.how_to_reg_outlined,
                  label: 'CHECKED IN',
                  value: Formatters.number(overview.checkedIn),
                  caption: overview.ticketsSold == 0
                      ? 'No tickets sold yet'
                      : 'of ${Formatters.number(overview.ticketsSold)} sold',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:evetick_organizer/core/helpers/formatters.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';
import 'package:evetick_organizer/features/event_dashboard/presentation/widgets/dashboard_stat_card.dart';
import 'package:flutter/material.dart';

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key, required this.dashboard});

  final EventDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final soldPercent = (dashboard.sellThrough * 100).round();

    return Column(
      children: [
        DashboardStatCard(
          icon: Icons.payments_outlined,
          label: 'TOTAL REVENUE',
          value: Formatters.money(dashboard.revenue),
          valueColor: ColorsManager.orange,
          caption: 'From ${Formatters.number(dashboard.ticketsSold)} tickets',
        ),
        verticalSpace(12),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.confirmation_number_outlined,
                  label: 'TICKETS SOLD',
                  value: Formatters.number(dashboard.ticketsSold),
                  caption:
                      '$soldPercent% of ${Formatters.number(dashboard.capacity)}',
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.how_to_reg_outlined,
                  label: 'CHECKED IN',
                  value: Formatters.number(dashboard.checkedIn),
                  caption: dashboard.ticketsSold == 0
                      ? 'No tickets sold yet'
                      : 'of ${Formatters.number(dashboard.ticketsSold)} sold',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:evetick_organizer/core/helpers/formatters.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';
import 'package:evetick_organizer/features/event_dashboard/presentation/widgets/dashboard_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

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
          label: AppLocalizations.of(context)!.dashboardTotalRevenue,
          value: Formatters.money(context, dashboard.revenue),
          valueColor: ColorsManager.orange,
          caption: AppLocalizations.of(context)!.dashboardFromTickets(
            Formatters.number(context, dashboard.ticketsSold),
          ),
        ),
        verticalSpace(12),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.confirmation_number_outlined,
                  label: AppLocalizations.of(context)!.homeStatTicketsSold,
                  value: Formatters.number(context, dashboard.ticketsSold),
                  caption:
                      AppLocalizations.of(context)!.homeStatSoldPercent(
                        soldPercent,
                        Formatters.number(context, dashboard.capacity),
                      ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.how_to_reg_outlined,
                  label: AppLocalizations.of(context)!.homeStatCheckedIn,
                  value: Formatters.number(context, dashboard.checkedIn),
                  caption: dashboard.ticketsSold == 0
                      ? AppLocalizations.of(context)!.homeStatNoTicketsSold
                      : AppLocalizations.of(context)!.homeStatOfSold(
                        Formatters.number(context, dashboard.ticketsSold),
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

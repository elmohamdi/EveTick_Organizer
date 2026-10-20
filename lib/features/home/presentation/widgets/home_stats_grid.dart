import 'package:evetick_organizer/core/helpers/formatters.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/event_dashboard/presentation/widgets/dashboard_stat_card.dart';
import 'package:evetick_organizer/features/home/data/models/home_overview.dart';
import 'package:flutter/material.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

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
                  label: AppLocalizations.of(context)!.homeStatRevenue,
                  value: Formatters.money(context, overview.revenue),
                  valueColor: ColorsManager.orange,
                  caption: AppLocalizations.of(context)!.homeStatAllEvents,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.confirmation_number_outlined,
                  label: AppLocalizations.of(context)!.homeStatTicketsSold,
                  value: Formatters.number(context, overview.ticketsSold),
                  caption:
                      AppLocalizations.of(context)!.homeStatSoldPercent(
                        soldPercent,
                        Formatters.number(context, overview.capacity),
                      ),
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
                  label: AppLocalizations.of(context)!.homeStatEvents,
                  value: Formatters.number(context, overview.totalEvents),
                  caption: AppLocalizations.of(context)!.homeStatLiveNow(
                    Formatters.number(context, overview.liveEvents),
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: DashboardStatCard(
                  icon: Icons.how_to_reg_outlined,
                  label: AppLocalizations.of(context)!.homeStatCheckedIn,
                  value: Formatters.number(context, overview.checkedIn),
                  caption: overview.ticketsSold == 0
                      ? AppLocalizations.of(context)!.homeStatNoTicketsSold
                      : AppLocalizations.of(context)!.homeStatOfSold(
                        Formatters.number(context, overview.ticketsSold),
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

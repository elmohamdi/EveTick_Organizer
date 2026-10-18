import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/features/home/data/models/home_overview.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/home_empty_state.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/home_sales_chart_card.dart';
import 'package:evetick_organizer/features/home/presentation/widgets/home_stats_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.overview});

  final HomeOverview overview;

  @override
  Widget build(BuildContext context) {
    // MainContainer uses `extendBody`, so this padding already includes the
    // navbar height. The extra space keeps the last card clear of the FAB.
    final bottomInset = MediaQuery.paddingOf(context).bottom + 88.h;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, bottomInset),
      children: [
        HomeStatsGrid(overview: overview),
        verticalSpace(16),
        if (overview.isEmpty)
          const HomeEmptyState()
        else
          HomeSalesChartCard(events: overview.events),
      ],
    );
  }
}

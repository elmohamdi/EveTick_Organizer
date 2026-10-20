import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/outline_app_text_button.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';
import 'package:evetick_organizer/features/event_dashboard/logic/cubit/event_dashboard_cubit.dart';
import 'package:evetick_organizer/features/event_dashboard/logic/cubit/event_dashboard_state.dart';
import 'package:evetick_organizer/features/event_dashboard/presentation/widgets/dashboard_header_card.dart';
import 'package:evetick_organizer/features/event_dashboard/presentation/widgets/dashboard_stats_grid.dart';
import 'package:evetick_organizer/features/event_dashboard/presentation/widgets/ticket_tier_sales_tile.dart';
import 'package:evetick_organizer/features/event_staff/logic/cubit/event_staff_cubit.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/event_staff_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

/// Requires an [EventDashboardCubit] and an [EventStaffCubit] above it.
class EventDashboardScreen extends StatelessWidget {
  const EventDashboardScreen({super.key});

  Future<void> _refresh(BuildContext context) {
    return Future.wait([
      context.read<EventDashboardCubit>().load(isRefresh: true),
      context.read<EventStaffCubit>().loadStaff(isRefresh: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      appBar: AppBar(
        backgroundColor: context.colors.darkBlue,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.colors.white,
            size: 20.sp,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.dashboardTitle,
          style: TextStyles.font18WhiteBold(context),
        ),
      ),
      body: BlocBuilder<EventDashboardCubit, EventDashboardState>(
        builder: (context, state) {
          if (state is EventDashboardLoading ||
              state is EventDashboardInitial) {
            return const Center(
              child: CircularProgressIndicator(color: ColorsManager.orange),
            );
          }

          if (state is EventDashboardFailure) {
            return _ErrorView(
              message: state.error,
              onRetry: () => context.read<EventDashboardCubit>().load(),
            );
          }

          final dashboard = (state as EventDashboardSuccess).dashboard;
          return RefreshIndicator(
            color: ColorsManager.orange,
            backgroundColor: context.colors.lightBlue,
            onRefresh: () => _refresh(context),
            child: _DashboardContent(dashboard: dashboard),
          );
        },
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({required this.dashboard});

  final EventDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 32.h),
      children: [
        DashboardHeaderCard(dashboard: dashboard),
        verticalSpace(16),
        DashboardStatsGrid(dashboard: dashboard),
        verticalSpace(24),
        Text(AppLocalizations.of(context)!.dashboardTicketSales, style: TextStyles.font18WhiteBold(context)),
        verticalSpace(12),
        if (dashboard.tiers.isEmpty)
          Text(
            AppLocalizations.of(context)!.dashboardNoTiers,
            style: TextStyles.font14LightGrayRegular(context),
          )
        else
          for (final tier in dashboard.tiers) ...[
            TicketTierSalesTile(tier: tier),
            verticalSpace(8),
          ],
        // Managing the team is for the organizer only.
        if (dashboard.isOrganizer) ...[
          verticalSpace(16),
          const EventStaffSection(),
        ],
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyles.font16WhiteRegular(context),
            ),
            verticalSpace(16),
            OutlineAppTextButton(
              buttonText: AppLocalizations.of(context)!.commonTryAgain,
              buttonWidth: 160.w,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}

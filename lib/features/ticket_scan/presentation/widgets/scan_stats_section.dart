import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class ScanStatsSection extends StatelessWidget {
  const ScanStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final scanned = context.select(
      (TicketScanCubit cubit) => cubit.state.scannedCount,
    );
    final totalExpected = context.select(
      (TicketScanCubit cubit) => cubit.state.totalExpected,
    );
    final formatter = NumberFormat.decimalPattern('en');

    return Row(
      children: [
        Expanded(
          child: ScanStatCard(
            value: formatter.format(scanned),
            valueColor: ColorsManager.orange,
            label: AppLocalizations.of(context)!.scanStatScanned,
          ),
        ),
        Container(
          height: 38.h,
          width: 1.w,
          color: context.colors.secondaryBlue.withValues(alpha: 0.35),
        ),
        Expanded(
          child: ScanStatCard(
            value: formatter.format(totalExpected),
            valueColor: context.colors.white,
            label: AppLocalizations.of(context)!.scanStatTotalExpected,
          ),
        ),
      ],
    );
  }
}

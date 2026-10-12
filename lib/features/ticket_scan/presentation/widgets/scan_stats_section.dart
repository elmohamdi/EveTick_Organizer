import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanStatsSection extends StatelessWidget {
  final String scannedCount;
  final String totalExpectedCount;

  const ScanStatsSection({
    super.key,
    this.scannedCount = '428',
    this.totalExpectedCount = '1,250',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ScanStatCard(
            value: scannedCount,
            valueColor: ColorsManager.orange,
            label: 'SCANNED',
          ),
        ),
        Container(
          height: 38.h,
          width: 1.w,
          color: context.colors.secondaryBlue.withValues(alpha: 0.35),
        ),
        Expanded(
          child: ScanStatCard(
            value: totalExpectedCount,
            valueColor: context.colors.white,
            label: 'TOTAL EXPECTED',
          ),
        ),
      ],
    );
  }
}

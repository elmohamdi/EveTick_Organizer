import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_result.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Colored toast describing the outcome of a scan. Status colors are the same
/// in light and dark mode, and the text sits on them, so they are fixed.
class ScanResultBanner extends StatelessWidget {
  final ScanResult result;
  final VoidCallback? onDismiss;

  const ScanResultBanner({super.key, required this.result, this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final attendeeLine = [result.attendeeName, result.ticketType]
        .whereType<String>()
        .where((part) => part.trim().isNotEmpty)
        .join(' • ');

    final (Color color, IconData icon, String title, String? subtitle) =
        switch (result.status) {
          ScanStatus.verified => (
            ColorsManager.confirmed,
            Icons.check_rounded,
            'Ticket Verified',
            attendeeLine.isEmpty ? null : attendeeLine,
          ),
          ScanStatus.alreadyScanned => (
            ColorsManager.orange,
            Icons.warning_amber_rounded,
            'Already Scanned',
            attendeeLine.isEmpty ? null : attendeeLine,
          ),
          ScanStatus.invalid => (
            ColorsManager.red,
            Icons.close_rounded,
            'Invalid Ticket',
            'Code not found for this event',
          ),
          ScanStatus.error => (
            ColorsManager.red,
            Icons.error_outline_rounded,
            'Scan Failed',
            result.message,
          ),
        };

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.35),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38.w,
            height: 38.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.22),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.4),
                width: 1.5,
              ),
            ),
            child: Icon(icon, color: Colors.white, size: 22.sp),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null) ...[
                  verticalSpace(2),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onDismiss != null)
            InkWell(
              onTap: onDismiss,
              borderRadius: BorderRadius.circular(20.r),
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 20.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

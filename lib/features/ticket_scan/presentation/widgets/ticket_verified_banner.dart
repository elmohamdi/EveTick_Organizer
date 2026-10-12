import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketVerifiedBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onDismiss;

  const TicketVerifiedBanner({
    super.key,
    this.title = 'Ticket Verified',
    this.subtitle = 'John Doe • VIP Access',
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF00C882),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00C882).withValues(alpha: 0.35),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // White checkmark circle
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
            child: Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 22.sp,
            ),
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
                verticalSpace(2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});

  final Map<String, dynamic> event;

  @override
  Widget build(BuildContext context) {
    final title = event['eventTitle'] ?? 'No Title';
    final coverImageUrl = event['coverImageUrl'] as String?;
    final startAtStr = event['startAt'] as String?;

    DateTime? startAt;
    if (startAtStr != null) {
      startAt = DateTime.tryParse(startAtStr);
    }

    final status = event['status'] as String? ?? 'pending';
    final isLive = status.toLowerCase() == 'live';

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: coverImageUrl != null && coverImageUrl.isNotEmpty
                ? Image.network(
                    coverImageUrl,
                    width: 72.w,
                    height: 72.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 72.w,
                      height: 72.w,
                      color: ColorsManager.gray,
                      child: const Icon(
                        Icons.image,
                        color: ColorsManager.white,
                      ),
                    ),
                  )
                : Container(
                    width: 72.w,
                    height: 72.w,
                    color: ColorsManager.gray,
                    child: const Icon(Icons.image, color: ColorsManager.white),
                  ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.font16WhiteMid(
                    context,
                  ).copyWith(fontSize: 18.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                if (startAt != null)
                  Text(
                    DateFormat('MMM dd, yyyy • hh:mm a').format(startAt),
                    style: TextStyles.font12LightGrayRegular(
                      context,
                    ).copyWith(color: context.colors.lightGray),
                  ),
              ],
            ),
          ),
          horizontalSpace(8),
          Container(
            width: 73.w,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isLive
                  ? ColorsManager.confirmed
                  : context.colors.gray3.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              textAlign: TextAlign.center,
              isLive ? 'LIVE' : 'PENDING',
              style: TextStyles.font12Gray3Mid.copyWith(
                color: context.colors.white,
                fontSize: 10.sp,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

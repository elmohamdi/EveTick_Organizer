import 'dart:io';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PublishedEventInfoCard extends StatelessWidget {
  final String eventTitle;
  final String? imagePath;
  final DateTime startDate;
  final TimeOfDay startTime;

  const PublishedEventInfoCard({
    super.key,
    required this.eventTitle,
    this.imagePath,
    required this.startDate,
    required this.startTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.secondryBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: imagePath != null
                ? Image.file(
                    File(imagePath!),
                    width: 72.w,
                    height: 72.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 72.w,
                      height: 72.w,
                      color: ColorsManager.gray,
                      child:
                          const Icon(Icons.image, color: ColorsManager.white),
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
                  eventTitle,
                  style: TextStyles.font16WhiteMid(context).copyWith(
                    fontSize: 18.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                Text(
                  '${DateFormat('MMM dd, yyyy').format(startDate)} • ${startTime.format(context)}',
                  style: TextStyles.font12LightGrayRegular(context).copyWith(
                    color: ColorsManager.lightGray,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: ColorsManager.gray3.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'PENDING',
              style: TextStyles.font12Gray3Mid.copyWith(
                color: ColorsManager.white,
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

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/ticket_scan/data/models/scan_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanEventTile extends StatelessWidget {
  final ScanEvent event;
  final bool isSelected;
  final VoidCallback onTap;

  const ScanEventTile({
    super.key,
    required this.event,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: context.colors.lightBlue,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected
                  ? ColorsManager.orange
                  : context.colors.secondaryBlue.withValues(alpha: 0.25),
              width: isSelected ? 1.3 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font16WhiteMid(context),
                    ),
                    verticalSpace(4),
                    Text(
                      event.isLive ? 'LIVE' : 'PENDING',
                      style: TextStyles.font12Gray3Mid.copyWith(
                        color: event.isLive
                            ? ColorsManager.confirmed
                            : context.colors.gray3,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: ColorsManager.orange,
                  size: 22.sp,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

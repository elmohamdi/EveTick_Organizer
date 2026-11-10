import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

/// LIVE / PENDING pill shared by the event card and the event dashboard.
class EventStatusChip extends StatelessWidget {
  const EventStatusChip({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final isLive = status.toLowerCase() == 'live';

    return Container(
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
        isLive ? AppLocalizations.of(context)!.commonStatusLive : AppLocalizations.of(context)!.commonStatusPending,
        style: TextStyles.font12Gray3Mid.copyWith(
          color: context.colors.white,
          fontSize: 10.sp,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

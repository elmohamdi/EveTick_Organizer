import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsEmptyState extends StatelessWidget {
  const NotificationsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 56.sp,
              color: context.colors.gray3,
            ),
            verticalSpace(12),
            Text(
              l10n.notificationsEmptyTitle,
              textAlign: TextAlign.center,
              style: TextStyles.font18WhiteBold(context),
            ),
            verticalSpace(6),
            Text(
              l10n.notificationsEmptySubtitle,
              textAlign: TextAlign.center,
              style: TextStyles.font14LightGrayRegular(context),
            ),
          ],
        ),
      ),
    );
  }
}

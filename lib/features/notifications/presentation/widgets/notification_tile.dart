import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/notifications/data/models/app_notification.dart';
import 'package:evetick_organizer/features/notifications/presentation/helpers/notification_time_formatter.dart';
import 'package:evetick_organizer/features/notifications/presentation/widgets/notification_labels.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final AppNotification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final accent = notification.type.color;
    final isUnread = !notification.isRead;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Material(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(14.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    notification.type.icon,
                    size: 22.sp,
                    color: accent,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.title(l10n),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: isUnread
                                  ? TextStyles.font16WhiteBold(context)
                                  : TextStyles.font16WhiteMid(context),
                            ),
                          ),
                          horizontalSpace(8),
                          Text(
                            NotificationTimeFormatter.format(
                              context,
                              notification.createdAt,
                            ),
                            style: TextStyles.font12LightGrayRegular(context),
                          ),
                        ],
                      ),
                      verticalSpace(4),
                      Text(
                        notification.body(l10n),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14LightGrayRegular(context),
                      ),
                    ],
                  ),
                ),
                if (isUnread) ...[
                  horizontalSpace(8),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: const BoxDecoration(
                        color: ColorsManager.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

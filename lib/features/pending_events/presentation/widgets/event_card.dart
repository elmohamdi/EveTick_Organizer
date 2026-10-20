import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/event_status_chip.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';
import 'package:evetick_organizer/features/event_staff/presentation/widgets/staff_labels.dart';
import 'package:evetick_organizer/features/pending_events/presentation/widgets/manage_event_button.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, this.onManage});

  final Map<String, dynamic> event;

  /// Opens the event dashboard. The "Manage Event" button is hidden when null.
  final VoidCallback? onManage;

  @override
  Widget build(BuildContext context) {
    final title = event['eventTitle'] ?? AppLocalizations.of(context)!.myEventsNoTitle;
    final coverImageUrl = event['coverImageUrl'] as String?;
    final startAtStr = event['startAt'] as String?;

    String roleLabel(BuildContext context, String? key) =>
        StaffRole.fromKey(key).label(AppLocalizations.of(context)!);
    DateTime? startAt;
    if (startAtStr != null) {
      startAt = DateTime.tryParse(startAtStr);
    }

    final status = event['status'] as String? ?? 'pending';

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
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
                        child: const Icon(
                          Icons.image,
                          color: ColorsManager.white,
                        ),
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
                    if (event['isStaffEvent'] == true) ...[
                      verticalSpace(4),
                      Text(
                        '${AppLocalizations.of(context)!.staffSectionTitle} • '
                        '${roleLabel(context, event['staffRole'] as String?)}',
                        style: TextStyles.font12LightGrayRegular(
                          context,
                        ).copyWith(color: ColorsManager.orange),
                      ),
                    ],
                    verticalSpace(8),
                    if (startAt != null)
                      Text(
                        DateFormat('MMM dd, yyyy • hh:mm a', Localizations.localeOf(context).toString()).format(startAt),
                        style: TextStyles.font12LightGrayRegular(
                          context,
                        ).copyWith(color: context.colors.lightGray),
                      ),
                  ],
                ),
              ),
              horizontalSpace(8),
              EventStatusChip(status: status),
            ],
          ),
          if (onManage != null) ...[
            verticalSpace(16),
            ManageEventButton(onTap: onManage!),
          ],
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/event_status_chip.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DashboardHeaderCard extends StatelessWidget {
  const DashboardHeaderCard({super.key, required this.dashboard});

  final EventDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final startAt = dashboard.startAt;
    final location = dashboard.isOnline
        ? 'Online event'
        : (dashboard.location.isEmpty ? 'No location' : dashboard.location);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: _CoverImage(url: dashboard.coverImageUrl),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: EventStatusChip(status: dashboard.status),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dashboard.title,
                  style: TextStyles.font18WhiteBold(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(12),
                if (startAt != null) ...[
                  _InfoRow(
                    icon: Icons.calendar_today_outlined,
                    text: DateFormat('EEE, MMM dd, yyyy • hh:mm a')
                        .format(startAt),
                  ),
                  verticalSpace(8),
                ],
                _InfoRow(
                  icon: dashboard.isOnline
                      ? Icons.videocam_outlined
                      : Icons.location_on_outlined,
                  text: location,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    Widget placeholder() => Container(
      color: ColorsManager.orange.withValues(alpha: 0.15),
      child: Icon(Icons.image_outlined, color: ColorsManager.orange, size: 40.sp),
    );

    final imageUrl = url;
    if (imageUrl == null || imageUrl.isEmpty) return placeholder();

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (_, _) => placeholder(),
      errorWidget: (_, _, _) => placeholder(),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: context.colors.lightGray),
        horizontalSpace(8),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font14LightGrayRegular(context),
          ),
        ),
      ],
    );
  }
}

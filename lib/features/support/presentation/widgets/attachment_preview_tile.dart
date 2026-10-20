import 'dart:io';

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/support/data/models/support_attachment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A picked screenshot with its name, size and a remove button.
class AttachmentPreviewTile extends StatelessWidget {
  const AttachmentPreviewTile({
    super.key,
    required this.attachment,
    required this.removeTooltip,
    required this.onRemove,
  });

  final SupportAttachment attachment;
  final String removeTooltip;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.file(
              File(attachment.path),
              width: 48.w,
              height: 48.w,
              fit: BoxFit.cover,
              cacheWidth: 200,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 48.w,
                height: 48.w,
                color: context.colors.textBackground,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 22.sp,
                  color: context.colors.gray3,
                ),
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  attachment.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font16WhiteMid(context),
                ),
                verticalSpace(2),
                Text(
                  attachment.readableSize,
                  style: TextStyles.font12LightGrayRegular(context),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: removeTooltip,
            onPressed: onRemove,
            icon: Icon(
              Icons.close_rounded,
              size: 22.sp,
              color: context.colors.gray3,
            ),
          ),
        ],
      ),
    );
  }
}

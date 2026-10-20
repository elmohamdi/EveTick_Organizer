import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/dashed_border_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Dashed "Upload Screenshot" drop zone.
class AttachmentPickerButton extends StatelessWidget {
  const AttachmentPickerButton({
    super.key,
    required this.label,
    required this.isLoading,
    required this.onTap,
  });

  final String label;
  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: context.colors.gray3,
          radius: 14.r,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                SizedBox(
                  width: 22.w,
                  height: 22.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: ColorsManager.orange,
                  ),
                )
              else
                Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 26.sp,
                  color: context.colors.lightGray,
                ),
              horizontalSpace(10),
              Text(label, style: TextStyles.font16LightGrayRegular(context)),
            ],
          ),
        ),
      ),
    );
  }
}

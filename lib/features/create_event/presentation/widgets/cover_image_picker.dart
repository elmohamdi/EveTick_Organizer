import 'dart:io';

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/dashed_border_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CoverImagePicker extends StatelessWidget {
  const CoverImagePicker({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  final XFile? imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: context.colors.lightBlue,
          radius: 12.r,
        ),
        child: Container(
          width: double.infinity,
          height: 180.h,
          alignment: Alignment.center,
          child: imagePath == null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colors.textBackground,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: ColorsManager.orange,
                        size: 22.sp,
                      ),
                    ),
                    verticalSpace(12),
                    Text(
                      'Upload Cover Photo',
                      style: TextStyles.font16WhiteRegular(context),
                    ),
                    verticalSpace(4),
                    Text(
                      'Recommended size: 1200 x 675px',
                      style: TextStyles.font14Gray3Regular,
                    ),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                    File(imagePath!.path),
                    width: double.infinity,
                    height: 180.h,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}

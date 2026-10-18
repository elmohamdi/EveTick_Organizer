import 'dart:io';

import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPhotoSlot extends StatelessWidget {
  const GalleryPhotoSlot({
    super.key,
    required this.imagePath,
    required this.isNextEmptySlot,
    required this.onTap,
    required this.onRemove,
  });

  final XFile? imagePath;
  final bool isNextEmptySlot;
  final VoidCallback? onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final bool isFilled = imagePath != null;

    return InkWell(
      onTap: isFilled ? null : onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 78.w,
        decoration: BoxDecoration(
          color: context.colors.fourthBlue,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: context.colors.lightBlue, width: 1.3),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isFilled)
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  File(imagePath!.path),
                  width: 78.w,
                  height: 90.h,
                  fit: BoxFit.cover,
                ),
              )
            else
              Icon(
                isNextEmptySlot ? Icons.add : Icons.image_outlined,
                color: isNextEmptySlot
                    ? ColorsManager.orange
                    : context.colors.gray3,
                size: 26.sp,
              ),
            if (isFilled)
              Positioned(
                top: 4.h,
                right: 4.w,
                child: InkWell(
                  onTap: onRemove,
                  child: Icon(
                    Icons.close,
                    color: context.colors.white,
                    size: 16.sp,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const int _maxGalleryPhotos = 5;

class BuildMediaDetails extends StatefulWidget {
  const BuildMediaDetails({super.key, this.onNextStep});

  final VoidCallback? onNextStep;

  @override
  State<BuildMediaDetails> createState() => _BuildMediaDetailsState();
}

class _BuildMediaDetailsState extends State<BuildMediaDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();

  // Holds a path/identifier per slot once picked. Null = empty slot.
  String? coverImage;
  final List<String?> galleryPhotos = List<String?>.filled(_maxGalleryPhotos, null);

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  // TODO: wire these up to an actual picker (e.g. the `image_picker` package)
  // once it's added to pubspec.yaml. For now they just mark a slot as filled
  // so the rest of the flow (preview + validation) can be built against it.
  Future<void> _pickCoverImage() async {
    setState(() => coverImage = 'cover_image_placeholder');
  }

  Future<void> _pickGalleryPhoto(int index) async {
    setState(() => galleryPhotos[index] = 'gallery_photo_$index');
  }

  void _removeGalleryPhoto(int index) {
    setState(() => galleryPhotos[index] = null);
  }

  void _onNextStepPressed() {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (coverImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload a cover image')),
      );
      return;
    }

    if (!isValid) return;

    widget.onNextStep?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Media Files', style: TextStyles.font24OrangeBold),
            verticalSpace(4),
            Text(
              'Add visuals to attract more attendees',
              style: TextStyles.font16lightGrayMid(context),
            ),

            verticalSpace(24),

            Text('Cover Image', style: TextStyles.font16WhiteRegular(context)),
            verticalSpace(8),
            _CoverImagePicker(imagePath: coverImage, onTap: _pickCoverImage),

            verticalSpace(24),

            Text(
              'Gallery Photos (Optional)',
              style: TextStyles.font16WhiteRegular(context),
            ),
            verticalSpace(8),
            SizedBox(
              height: 90.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _maxGalleryPhotos,
                separatorBuilder: (_, __) => horizontalSpace(12),
                itemBuilder: (context, index) {
                  return _GalleryPhotoSlot(
                    imagePath: galleryPhotos[index],
                    isNextEmptySlot: galleryPhotos[index] == null &&
                        !galleryPhotos.sublist(0, index).any((p) => p == null),
                    onTap: () => _pickGalleryPhoto(index),
                    onRemove: () => _removeGalleryPhoto(index),
                  );
                },
              ),
            ),
            verticalSpace(8),
            Text(
              'maximum $_maxGalleryPhotos photos, up to 5MB each.',
              style: TextStyles.font14LightGrayRegular(context),
            ),

            verticalSpace(24),

            AppTextFormField(
              hintText: 'Tell your attendees what to expect this amazing event...',
              controller: descriptionController,
              maxLines: 5,
              maxLength: 2000,
            ),

            verticalSpace(32),

            FilledAppTextButton(
              buttonText: 'Next Step',
              onPressed: _onNextStepPressed,
            ),

            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}

class _CoverImagePicker extends StatelessWidget {
  const _CoverImagePicker({required this.imagePath, required this.onTap});

  final String? imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: CustomPaint(
        painter: _DashedBorderPainter(
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
                        color: context.colors.fourthBlue,
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
                      style: TextStyles.font14LightGrayRegular(context),
                    ),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(color: context.colors.fourthBlue),
                  // TODO: replace with Image.file/Image.network once real
                  // image data is available from the picker.
                ),
        ),
      ),
    );
  }
}

class _GalleryPhotoSlot extends StatelessWidget {
  const _GalleryPhotoSlot({
    required this.imagePath,
    required this.isNextEmptySlot,
    required this.onTap,
    required this.onRemove,
  });

  final String? imagePath;
  final bool isNextEmptySlot;
  final VoidCallback onTap;
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
            Icon(
              isFilled
                  ? Icons.image
                  : (isNextEmptySlot ? Icons.add : Icons.image_outlined),
              color: isNextEmptySlot && !isFilled
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

/// Lightweight dashed-border painter so we don't have to pull in an extra
/// package (e.g. `dotted_border`) just for the cover-image upload box.
class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);
    const dashWidth = 6.0;
    const dashSpace = 4.0;

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) => false;
}

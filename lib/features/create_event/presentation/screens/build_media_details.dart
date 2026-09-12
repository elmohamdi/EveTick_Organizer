import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/cover_image_picker.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/gallery_photo_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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

  XFile? coverImage;
  final List<XFile?> galleryPhotos = List<XFile?>.filled(
    _maxGalleryPhotos,
    null,
  );
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickCoverImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) return;

    setState(() {
      coverImage = image;
    });
  }

  Future<void> _pickGalleryPhoto(int index) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) return;

    setState(() {
      galleryPhotos[index] = image;
    });
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
            CoverImagePicker(imagePath: coverImage, onTap: _pickCoverImage),

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
                separatorBuilder: (_, _) => horizontalSpace(12),
                itemBuilder: (context, index) {
                  final bool isNextEmptySlot =
                      galleryPhotos[index] == null &&
                      !galleryPhotos.sublist(0, index).any((p) => p == null);

                  return GalleryPhotoSlot(
                    imagePath: galleryPhotos[index],
                    isNextEmptySlot: isNextEmptySlot,
                    onTap: isNextEmptySlot
                        ? () => _pickGalleryPhoto(index)
                        : null,
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
              hintText:
                  'Tell your attendees what to expect this amazing event...',
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

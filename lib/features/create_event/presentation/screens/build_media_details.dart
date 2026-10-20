import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/create_event/helpers/persist_picked_image.dart';
import 'package:evetick_organizer/features/create_event/logic/cubit/create_event_cubit.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/cover_image_picker.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/gallery_photo_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

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
    final saved = await persistPickedImage(image);
    if (!mounted) return;

    setState(() {
      coverImage = saved;
    });
    context.read<CreateEventCubit>().updateEventCoverImage(saved);
  }

  Future<void> _pickGalleryPhoto(int index) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) return;
    final saved = await persistPickedImage(image);
    if (!mounted) return;

    setState(() {
      galleryPhotos[index] = saved;
    });
    context.read<CreateEventCubit>().updateEventGalleryPhotos(
      galleryPhotos.whereType<XFile>().toList(),
    );
  }

  void _removeGalleryPhoto(int index) {
    setState(() => galleryPhotos[index] = null);

    context.read<CreateEventCubit>().updateEventGalleryPhotos(
      galleryPhotos.whereType<XFile>().toList(),
    );
  }

  void _onNextStepPressed() {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (coverImage == null) {
      AppToast.error(context, AppLocalizations.of(context)!.createEventCoverRequired);
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
            Text(AppLocalizations.of(context)!.createEventMediaTitle, style: TextStyles.font24OrangeBold),
            verticalSpace(4),
            Text(
              AppLocalizations.of(context)!.createEventMediaSubtitle,
              style: TextStyles.font16Gray3Regular,
            ),

            verticalSpace(24),

            Text(AppLocalizations.of(context)!.createEventCoverImage, style: TextStyles.font16WhiteRegular(context)),
            verticalSpace(8),
            CoverImagePicker(imagePath: coverImage, onTap: _pickCoverImage),

            verticalSpace(24),

            Text(
              AppLocalizations.of(context)!.createEventGalleryPhotos,
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
              AppLocalizations.of(context)!.createEventGalleryLimit(_maxGalleryPhotos),
              style: TextStyles.font14Gray3Regular,
            ),

            verticalSpace(24),

            AppTextFormField(
              onChanged: (value) {
                context.read<CreateEventCubit>().updateDescription(value);
              },
              hintText:
                  AppLocalizations.of(context)!.createEventDescriptionHint,
              controller: descriptionController,
              maxLines: 5,
              maxLength: 2000,
              hintStyle: TextStyles.font14Gray3Regular,
            ),

            verticalSpace(32),

            FilledAppTextButton(
              buttonText: AppLocalizations.of(context)!.createEventNextStep,
              onPressed: _onNextStepPressed,
            ),

            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}

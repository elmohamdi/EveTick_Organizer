import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileAppBar extends StatelessWidget {
  final bool isEditing;
  final bool isLoading;
  final VoidCallback onActionPressed;

  const EditProfileAppBar({
    super.key,
    required this.isEditing,
    this.isLoading = false,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.darkBlue,
      title: Text(AppLocalizations.of(context)!.profilePersonalInfoTitle),
      centerTitle: true,
      titleTextStyle: TextStyles.font18DarkBlueBold(context),
      leading: GestureDetector(
        onTap: context.pop,
        child: Icon(Icons.arrow_back_ios, color: context.colors.white),
      ),
      actions: [
        GestureDetector(
          onTap: onActionPressed,
          child: isEditing
              ? isLoading
                    ? SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          color: ColorsManager.orange,
                          strokeWidth: 2.sp,
                        ),
                      )
                    : Text(
                        AppLocalizations.of(context)!.profileSave,
                        style: TextStyles.font16OrangeRegular,
                      )
              : SvgPicture.asset(
                  'assets/svgs/enable_edit.svg',
                  color: context.colors.lightGray,
                ),
        ),
        horizontalSpace(16),
      ],
    );
  }
}

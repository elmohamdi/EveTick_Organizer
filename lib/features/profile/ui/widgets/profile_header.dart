import 'package:cached_network_image/cached_network_image.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/profile/logic/profile_cubit.dart';
import 'package:evetick_organizer/features/profile/logic/profile_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final bool isEditable;
  const ProfileHeader({super.key, this.isEditable = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          updatingProfile: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(color: ColorsManager.orange),
          ),

          success: (user) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 120.w,
                      height: 120.h,
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(
                          color: ColorsManager.orange,
                          width: 1.w,
                        ),
                      ),
                      child: ClipOval(
                        child: user.imageUrl == null
                            ? Image.asset(
                                'assets/images/profile_image.png',
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: user.imageUrl!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorsManager.orange,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                      'assets/images/profile_image.png',
                                      fit: BoxFit.cover,
                                    ),
                              ),
                      ),
                    ),
                    if (isEditable)
                      Positioned(
                        bottom: 0,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () {
                            context.read<ProfileCubit>().uploadProfileImage();
                          },
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: ColorsManager.orange,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: context.colors.darkBlue,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                verticalSpace(16.h),
                Text(user.name, style: TextStyles.font18WhiteBold(context)),
                verticalSpace(4.h),
                Text(
                  AppLocalizations.of(context)!.profilePremiumAttendee,
                  style: TextStyles.font16OrangeRegular,
                ),
              ],
            );
          },

          uploadingImage: () {
            return const CircularProgressIndicator(strokeWidth: 2);
          },

          error: (error) => Center(child: Text(error)),
        );
      },
    );
  }
}

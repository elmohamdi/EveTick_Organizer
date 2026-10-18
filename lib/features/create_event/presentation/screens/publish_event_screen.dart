import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/published_event_info_card.dart';

class PublishEventScreen extends StatelessWidget {
  final String eventTitle;
  final String? imagePath;
  final DateTime startDate;
  final TimeOfDay startTime;

  const PublishEventScreen({
    super.key,
    required this.eventTitle,
    this.imagePath,
    required this.startDate,
    required this.startTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 140.w,
                height: 140.w,
                decoration: const BoxDecoration(
                  color: ColorsManager.orange,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.edit_calendar_rounded,
                  color: ColorsManager.white,
                  size: 80.sp,
                ),
              ),
              verticalSpace(32),
              Text(
                'Congratulations!',
                style: TextStyles.font24WhiteBold(context).copyWith(
                  fontSize: 28.sp,
                ),
              ),
              verticalSpace(12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyles.font16WhiteRegular(context).copyWith(
                    color: ColorsManager.white,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(text: 'Your event is now '),
                    TextSpan(
                      text: 'UnderReview!\n',
                      style: TextStyles.font16WhiteRegular(context).copyWith(
                        color: ColorsManager.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: 'please wait for our respond.'),
                  ],
                ),
              ),
              verticalSpace(48),
              PublishedEventInfoCard(
                eventTitle: eventTitle,
                imagePath: imagePath,
                startDate: startDate,
                startTime: startTime,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: ColorsManager.orange,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () => context.pushNamedAndRemoveUntil(
                    Routes.homeScreen,
                    predicate: (route) => false,
                  ),
                  child: Text(
                    'Go To Home',
                    style: TextStyles.font16WhiteMid(context),
                  ),
                ),
              ),
              verticalSpace(32),
            ],
          ),
        ),
      ),
    );
  }
}

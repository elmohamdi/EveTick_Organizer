import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shown right after an event has been successfully published (written to
/// Firestore). Previously this screen was just a [Placeholder], so even
/// when publishing worked the user landed on a blank/striped screen.
class PublishEvent extends StatelessWidget {
  const PublishEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: context.colors.darkBlue,
                size: 96.sp,
              ),
              verticalSpace(24),
              Text(
                'تم نشر الحدث بنجاح',
                textAlign: TextAlign.center,
                style: TextStyles.font18WhiteBold(
                  context,
                ).copyWith(color: context.colors.black),
              ),
              verticalSpace(32),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: context.colors.darkBlue,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  onPressed: () => context.pushNamedAndRemoveUntil(
                    Routes.homeScreen,
                    predicate: (route) => false,
                  ),
                  child: const Text('رجوع للرئيسية'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

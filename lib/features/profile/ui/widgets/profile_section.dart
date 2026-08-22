import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/profile/ui/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileSection extends StatelessWidget {
  final String sectionTitle;
  final String firstIconPath;
  final String secondIconPath;
  final String firstTitle;
  final String secondTitle;
  final String? firstSubtitle;
  final String? secondSubtitle;
  final String? firstTrailingText;
  final String? secondTrailingText;
  final VoidCallback? firstAction;
final VoidCallback? secondAction;
  
  const ProfileSection({
    super.key,
    required this.sectionTitle,
    required this.firstIconPath,
    required this.secondIconPath,
    required this.firstTitle,
    required this.secondTitle,
    this.firstSubtitle,
    this.secondSubtitle,
    this.firstTrailingText,
    this.secondTrailingText,
    this.firstAction,
    this.secondAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sectionTitle, style: TextStyles.font16lightGrayMid(context)),
        verticalSpace(16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colors.lightBlue,
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
            child: Column(
              children: [
                ProfileTile(
                  iconPath: firstIconPath,
                  title: firstTitle,
                  subtitle: firstSubtitle,
                  trailingText: firstTrailingText,
                  onTap: firstAction,
                ),

                Divider(color: context.colors.darkBlue, thickness: 1),

                ProfileTile(
                  iconPath: secondIconPath,
                  title: secondTitle,
                  subtitle: secondSubtitle,
                  trailingText: secondTrailingText,
                  onTap: secondAction,
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}

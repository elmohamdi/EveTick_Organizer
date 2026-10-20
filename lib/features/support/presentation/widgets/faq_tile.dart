import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/font_weight_helper.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One expandable question. The parent decides which tile is open.
class FaqTile extends StatelessWidget {
  const FaqTile({
    super.key,
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: TextStyles.font16WhiteMid(context),
                  ),
                ),
                SizedBox(width: 12.w),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 26.sp,
                    color: context.colors.lightGray,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: isExpanded
              ? Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      answer,
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.6,
                        fontWeight: FontWeightHelper.regular,
                        color: context.colors.lightGray,
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: double.infinity, height: 0),
        ),
        Divider(
          height: 1,
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ],
    );
  }
}

import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/font_weight_helper.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Highlighted card for an important remark inside a section.
class TermsNoteCard extends StatelessWidget {
  const TermsNoteCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.textBackground,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: TermsRichText(
        text: text,
        style: TextStyle(
          fontSize: 16.sp,
          height: 1.6,
          fontWeight: FontWeightHelper.regular,
          color: context.colors.lightGray,
        ),
      ),
    );
  }
}

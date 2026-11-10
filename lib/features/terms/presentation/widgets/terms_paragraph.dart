import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/font_weight_helper.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsParagraph extends StatelessWidget {
  const TermsParagraph({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TermsRichText(
        text: text,
        style: TextStyle(
          fontSize: 16.sp,
          height: 1.7,
          fontWeight: FontWeightHelper.regular,
          color: context.colors.lightGray,
        ),
      ),
    );
  }
}

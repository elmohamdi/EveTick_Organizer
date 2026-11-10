import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/font_weight_helper.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A term with an orange icon in front of it.
class TermsItemRow extends StatelessWidget {
  const TermsItemRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Icon(icon, size: 28.sp, color: ColorsManager.orange),
        ),
        horizontalSpace(12),
        Expanded(
          child: TermsRichText(
            text: text,
            style: TextStyle(
              fontSize: 16.sp,
              height: 1.7,
              fontWeight: FontWeightHelper.regular,
              color: context.colors.lightGray,
            ),
          ),
        ),
      ],
    );
  }
}

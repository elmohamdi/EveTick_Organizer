import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_section.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_block_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "1. Acceptance of Terms" followed by the blocks of the section.
class TermsSectionView extends StatelessWidget {
  const TermsSectionView({
    super.key,
    required this.number,
    required this.section,
  });

  /// Starts at 1.
  final int number;
  final TermsSection section;

  @override
  Widget build(BuildContext context) {
    final title = section.title.resolve(
      Localizations.localeOf(context).languageCode,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number. $title',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: context.colors.white,
          ),
        ),
        verticalSpace(12),
        for (var i = 0; i < section.blocks.length; i++) ...[
          if (i > 0) verticalSpace(14),
          TermsBlockView(block: section.blocks[i]),
        ],
      ],
    );
  }
}

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/features/terms/data/models/terms_document.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_header.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_section_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The scrollable, read-only text of the terms.
class TermsDocumentView extends StatelessWidget {
  const TermsDocumentView({super.key, required this.document});

  final TermsDocument document;

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return ListView(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 32.h),
      children: [
        TermsHeader(lastUpdated: document.lastUpdated.resolve(languageCode)),
        verticalSpace(24),
        for (var i = 0; i < document.sections.length; i++) ...[
          if (i > 0) verticalSpace(28),
          TermsSectionView(number: i + 1, section: document.sections[i]),
        ],
      ],
    );
  }
}

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TermsHeader extends StatelessWidget {
  const TermsHeader({super.key, required this.lastUpdated});

  /// Already in the current language, e.g. "October 2026".
  final String lastUpdated;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.termsSubtitle, style: TextStyles.font24WhiteBold(context)),
        if (lastUpdated.isNotEmpty) ...[
          verticalSpace(6),
          Text(
            l10n.termsLastUpdated(lastUpdated),
            style: TextStyles.font16OrangeRegular,
          ),
        ],
      ],
    );
  }
}

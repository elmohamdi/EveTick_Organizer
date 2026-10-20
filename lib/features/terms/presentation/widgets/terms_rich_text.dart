import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';

/// Text where the words between `**double stars**` are shown in orange.
class TermsRichText extends StatelessWidget {
  const TermsRichText({super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    // Odd pieces are the ones that were between the stars.
    final parts = text.split('**');

    return Text.rich(
      TextSpan(
        style: style,
        children: [
          for (var i = 0; i < parts.length; i++)
            if (parts[i].isNotEmpty)
              TextSpan(
                text: parts[i],
                style: i.isOdd
                    ? const TextStyle(
                        color: ColorsManager.orange,
                        fontWeight: FontWeightHelper.medium,
                      )
                    : null,
              ),
        ],
      ),
    );
  }
}

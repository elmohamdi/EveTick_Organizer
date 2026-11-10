import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class SupportSectionTitle extends StatelessWidget {
  const SupportSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyles.font18WhiteBold(context));
  }
}

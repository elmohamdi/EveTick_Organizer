import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class OrDevider extends StatelessWidget {
  const OrDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: ColorsManager.lightGray, thickness: 1)),
        Text(' or ', style: TextStyles.font16LightGrayMid(context)),
        Expanded(child: Divider(color: ColorsManager.lightGray, thickness: 1)),
      ],
    );
  }
}

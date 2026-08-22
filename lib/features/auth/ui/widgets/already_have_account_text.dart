import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context)!.authHasAccountPrompt,
              style: TextStyles.font12LightGrayRegular(context)
            ),
            TextSpan(
              text: AppLocalizations.of(context)!.authHasAccountPromptRemain,
              style: TextStyles.font12OrangeMid
            )
          ]
        )
        ),
    );
  }
}
import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BackToSignInButton extends StatelessWidget {
  const BackToSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pop(),
      child: Text(
        AppLocalizations.of(context)!.authBackToSignIn,
        style: TextStyles.font16OrangeRegular,
      ),
    );
  }
}

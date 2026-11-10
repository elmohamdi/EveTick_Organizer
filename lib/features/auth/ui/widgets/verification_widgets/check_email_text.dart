import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

class CheckEmailText extends StatelessWidget {
  const CheckEmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyles.font12LightGrayRegular(context).copyWith(
                  height: 1.45
                ),
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)!.authCheckEmailCodeSent
                    ),
                  TextSpan(
                      text: 'hello@evetick.com',
                      style: TextStyles.font12OrangeBold
                    )
                ]      
              )
              );
  }
}
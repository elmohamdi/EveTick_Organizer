import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<LoginCubit>().clearFields;
        context.pushNamed(Routes.signupScreen);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context)!.authNoAccountPrompt,
              style: TextStyles.font12LightGrayRegular(context)
            ),
            TextSpan(
              text: AppLocalizations.of(context)!.authNoAccountPromptRemain,
              style: TextStyles.font12OrangeMid
            )
          ]
        )
        ),
    );
  }
}
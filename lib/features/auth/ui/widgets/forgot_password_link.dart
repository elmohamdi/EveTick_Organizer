import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "Forgot password?" link under the password field of the login screen.
/// It passes the email typed so far so the next screen can pre-fill it.
class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: () => context.pushNamed(
          Routes.forgotPasswordScreen,
          arguments: context.read<LoginCubit>().emailController.text.trim(),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Text(
            AppLocalizations.of(context)!.authForgotPasswordLink,
            style: TextStyles.font12OrangeMid,
          ),
        ),
      ),
    );
  }
}

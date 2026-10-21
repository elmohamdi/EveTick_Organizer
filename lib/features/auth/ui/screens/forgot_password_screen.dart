import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_back_button.dart';
import 'package:evetick_organizer/core/widgets/app_logo.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/auth_background.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/back_to_sign_in_button.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/forgot_password_form.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/forgot_password_listener.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key, this.initialEmail});

  /// The email already typed on the login screen, if any.
  final String? initialEmail;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          const LoginBackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AppBackButton(),
                    verticalSpace(24),
                    const AppLogo(),
                    verticalSpace(24),
                    Text(
                      l10n.authForgotPasswordTitle,
                      style: TextStyles.font24WhiteBold(context),
                    ),
                    verticalSpace(12),
                    Text(
                      l10n.authForgotPasswordSubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyles.font16LightGrayRegular(context),
                    ),
                    verticalSpace(32),
                    ForgotPasswordListener(
                      child: ForgotPasswordForm(initialEmail: initialEmail),
                    ),
                    verticalSpace(24),
                    const BackToSignInButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

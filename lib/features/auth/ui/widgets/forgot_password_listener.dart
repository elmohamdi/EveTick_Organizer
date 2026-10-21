import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/features/auth/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/forgot_password_cubit/forgot_password_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// On success: shows the "link sent" toast and goes back to the login screen.
/// On failure: shows the error in a toast and stays on the screen.
class ForgotPasswordListener extends StatelessWidget {
  const ForgotPasswordListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        switch (state) {
          case ForgotPasswordSuccess():
            AppToast.success(
              context,
              AppLocalizations.of(context)!.authResetLinkSent,
            );
            context.pop();
          case ForgotPasswordError(:final message):
            AppToast.error(context, message);
          case _:
            break;
        }
      },
      child: child,
    );
  }
}

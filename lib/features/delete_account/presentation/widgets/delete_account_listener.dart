import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/features/delete_account/logic/cubit/delete_account_cubit.dart';
import 'package:evetick_organizer/features/delete_account/logic/cubit/delete_account_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// On success: shows a toast and restarts the app flow (the user is signed
/// out now, so the app start screen sends them to the welcome screen).
/// On failure: shows the error in a toast and stays on the screen.
class DeleteAccountListener extends StatelessWidget {
  const DeleteAccountListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        switch (state) {
          case DeleteAccountSuccess():
            AppToast.success(
              context,
              AppLocalizations.of(context)!.deleteAccountSuccess,
            );
            context.pushNamedAndRemoveUntil(
              Routes.appStartScreen,
              predicate: (route) => false,
            );
          case DeleteAccountError(:final message):
            AppToast.error(context, message);
          case _:
            break;
        }
      },
      child: child,
    );
  }
}

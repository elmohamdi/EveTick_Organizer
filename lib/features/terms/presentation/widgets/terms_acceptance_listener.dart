import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_acceptance_cubit.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_acceptance_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Accepted: restarts the app flow, which now continues to the location
/// step or the home screen. Rejected: the user is signed out, so the same
/// restart sends them back to the welcome screen.
class TermsAcceptanceListener extends StatelessWidget {
  const TermsAcceptanceListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TermsAcceptanceCubit, TermsAcceptanceState>(
      listener: (context, state) {
        switch (state) {
          case TermsAccepted():
            context.pushNamedAndRemoveUntil(
              Routes.appStartScreen,
              predicate: (route) => false,
            );
          case TermsRejected():
            AppToast.info(
              context,
              AppLocalizations.of(context)!.termsRejectedNotice,
            );
            context.pushNamedAndRemoveUntil(
              Routes.appStartScreen,
              predicate: (route) => false,
            );
          case TermsAcceptanceError(:final message):
            AppToast.error(context, message);
          case _:
            break;
        }
      },
      child: child,
    );
  }
}

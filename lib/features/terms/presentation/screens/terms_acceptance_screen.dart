import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_cubit.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_state.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_acceptance_body.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_acceptance_listener.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Shown once to a new user before they can enter the app. Requires a
/// [TermsCubit] and a `TermsAcceptanceCubit` above it.
class TermsAcceptanceScreen extends StatelessWidget {
  const TermsAcceptanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // No way around it: the user has to accept or reject.
      canPop: false,
      child: Scaffold(
        backgroundColor: context.colors.darkBlue,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: context.colors.darkBlue,
          title: Text(
            AppLocalizations.of(context)!.termsTitle,
            style: TextStyles.font18WhiteBold(context),
          ),
        ),
        body: SafeArea(
          child: TermsAcceptanceListener(
            child: BlocBuilder<TermsCubit, TermsState>(
              builder: (context, state) {
                final document = state.document;
                if (document == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.orange,
                    ),
                  );
                }
                return TermsAcceptanceBody(document: document);
              },
            ),
          ),
        ),
      ),
    );
  }
}

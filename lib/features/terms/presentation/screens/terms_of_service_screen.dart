import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/support/presentation/widgets/support_app_bar.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_cubit.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_state.dart';
import 'package:evetick_organizer/features/terms/presentation/widgets/terms_document_view.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Read-only terms of service. Requires a [TermsCubit] above it.
class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      appBar: SupportAppBar(
        title: AppLocalizations.of(context)!.termsTitle,
      ),
      body: SafeArea(
        child: BlocBuilder<TermsCubit, TermsState>(
          builder: (context, state) {
            final document = state.document;
            if (document == null) {
              return const Center(
                child: CircularProgressIndicator(color: ColorsManager.orange),
              );
            }
            return TermsDocumentView(document: document);
          },
        ),
      ),
    );
  }
}

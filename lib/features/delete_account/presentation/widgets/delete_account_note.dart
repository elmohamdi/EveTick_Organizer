import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/auth/data/models/reauth_method.dart';
import 'package:evetick_organizer/features/delete_account/logic/cubit/delete_account_cubit.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Tells the user how the deletion will be confirmed (Google or password).
class DeleteAccountNote extends StatelessWidget {
  const DeleteAccountNote({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final method = context.read<DeleteAccountCubit>().reauthMethod;

    final String? note = switch (method) {
      ReauthMethod.google => l10n.deleteAccountGoogleNote,
      ReauthMethod.password => l10n.deleteAccountPasswordNote,
      ReauthMethod.none => null,
    };
    if (note == null) return const SizedBox.shrink();

    return Text(
      note,
      textAlign: TextAlign.center,
      style: TextStyles.font16LightGrayRegular(context),
    );
  }
}

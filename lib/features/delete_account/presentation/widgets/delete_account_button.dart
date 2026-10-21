import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/auth/data/models/reauth_method.dart';
import 'package:evetick_organizer/features/delete_account/logic/cubit/delete_account_cubit.dart';
import 'package:evetick_organizer/features/delete_account/logic/cubit/delete_account_state.dart';
import 'package:evetick_organizer/features/delete_account/presentation/widgets/delete_account_password_sheet.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  Future<void> _onPressed(BuildContext context) async {
    final cubit = context.read<DeleteAccountCubit>();

    if (cubit.reauthMethod != ReauthMethod.password) {
      // Google asks for its own confirmation, guests have nothing to confirm.
      cubit.deleteAccount();
      return;
    }

    final String? password = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => const DeleteAccountPasswordSheet(),
    );
    if (password == null) return;

    cubit.deleteAccount(password: password);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteAccountCubit, DeleteAccountState>(
      builder: (context, state) {
        if (state is DeleteAccountLoading) {
          return SizedBox(
            height: 48.h,
            child: const Center(
              child: CircularProgressIndicator(color: ColorsManager.red),
            ),
          );
        }
        return FilledAppTextButton(
          buttonText: AppLocalizations.of(context)!.deleteAccountTitle,
          backgroundColor: ColorsManager.red,
          buttonWidth: 1.sw - 32.w,
          onPressed: () => _onPressed(context),
        );
      },
    );
  }
}

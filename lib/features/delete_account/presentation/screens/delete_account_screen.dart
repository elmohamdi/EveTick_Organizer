import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_back_button.dart';
import 'package:evetick_organizer/core/widgets/app_logo.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/auth_background.dart';
import 'package:evetick_organizer/features/delete_account/presentation/widgets/delete_account_button.dart';
import 'package:evetick_organizer/features/delete_account/presentation/widgets/delete_account_listener.dart';
import 'package:evetick_organizer/features/delete_account/presentation/widgets/delete_account_note.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

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
                child: DeleteAccountListener(
                  child: Column(
                    children: [
                      const AppBackButton(),
                      verticalSpace(24),
                      const AppLogo(),
                      verticalSpace(24),
                      Text(
                        l10n.deleteAccountTitle,
                        style: TextStyles.font24WhiteBold(context),
                      ),
                      verticalSpace(12),
                      Text(
                        l10n.deleteAccountDescription,
                        textAlign: TextAlign.center,
                        style: TextStyles.font16LightGrayRegular(context),
                      ),
                      verticalSpace(12),
                      const DeleteAccountNote(),
                      verticalSpace(32),
                      const DeleteAccountButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

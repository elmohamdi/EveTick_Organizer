import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/core/widgets/outline_app_text_button.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Bottom sheet that asks email/password users for their password before the
/// account is deleted. Pops with the typed password, or `null` if cancelled.
class DeleteAccountPasswordSheet extends StatefulWidget {
  const DeleteAccountPasswordSheet({super.key});

  @override
  State<DeleteAccountPasswordSheet> createState() =>
      _DeleteAccountPasswordSheetState();
}

class _DeleteAccountPasswordSheetState
    extends State<DeleteAccountPasswordSheet> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _confirm() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    Navigator.of(context).pop(_passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final double buttonWidth = 1.sw - 32.w;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 30.h,
          bottom: 30.h + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lock_outline, color: ColorsManager.red),
                    horizontalSpace(8),
                    Text(
                      l10n.deleteAccountPasswordSheetTitle,
                      style: TextStyles.font18WhiteBold(context),
                    ),
                  ],
                ),
                verticalSpace(8),
                Text(
                  l10n.deleteAccountPasswordSheetSubtitle,
                  style: TextStyles.font14LightGrayRegular(context),
                ),
                verticalSpace(24),
                AppTextFormField(
                  label: l10n.authPasswordLabel,
                  hintText: l10n.authPasswordPlaceholder,
                  controller: _passwordController,
                  isObscureText: _isObscure,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => _isObscure = !_isObscure),
                    child: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: context.colors.lightGray,
                      size: 24.sp,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.deleteAccountPasswordRequired;
                    }
                    return null;
                  },
                ),
                verticalSpace(24),
                FilledAppTextButton(
                  buttonText: l10n.commonConfirm,
                  backgroundColor: ColorsManager.red,
                  buttonWidth: buttonWidth,
                  onPressed: _confirm,
                ),
                verticalSpace(12),
                OutlineAppTextButton(
                  buttonText: l10n.commonCancel,
                  buttonWidth: buttonWidth,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:evetick_organizer/core/helpers/app_regex.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/widgets/app_text_form_field.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/auth/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/forgot_password_cubit/forgot_password_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key, this.initialEmail});

  final String? initialEmail;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController = TextEditingController(
    text: widget.initialEmail,
  );

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<ForgotPasswordCubit>().sendResetLink(
      _emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
            label: l10n.authEmailAddressLabel,
            hintText: l10n.authEmailPlaceholder,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icon(
              Icons.email_outlined,
              color: context.colors.lightGray,
              size: 24.sp,
            ),
            validator: (value) {
              if (value == null || !AppRegex.isEmailValid(value.trim())) {
                return l10n.authEmailInvalid;
              }
              return null;
            },
          ),
          verticalSpace(24),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (context, state) {
              if (state is ForgotPasswordLoading) {
                return SizedBox(
                  height: 48.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.orange,
                    ),
                  ),
                );
              }
              return FilledAppTextButton(
                buttonText: l10n.authSendResetLink,
                onPressed: _submit,
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/auth_background.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/auth_with_other_platforms.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/dont_have_account_text.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/email_and_password.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/login_bloc_listener.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoginBackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: (GoRouter.maybeOf(context)?.canPop() ?? false)
                          ? InkWell(
                              onTap: () {
                                Navigation(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: context.colors.white,
                                size: 24.sp,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    verticalSpace(24),
                    Align(
                      alignment: Alignment.center,
                      child: Theme.of(context).brightness == Brightness.dark
                          ? SvgPicture.asset('assets/svgs/dark_logo.svg')
                          : SvgPicture.asset('assets/svgs/light_logo.svg'),
                    ),
                    verticalSpace(24),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.authSignIn,
                        style: TextStyles.font24WhiteBold(context),
                      ),
                    ),
                    verticalSpace(32),
                    const LoginBlocListener(),
                    EmailAndPassword(),
                    verticalSpace(24),
                    FilledAppTextButton(
                      buttonText: AppLocalizations.of(context)!.commonContinue,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(32),
                    LoginWithOtherPlatforms(),
                    verticalSpace(32),
                    const DontHaveAccountText(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        email: context.read<LoginCubit>().emailController.text,
        password: context.read<LoginCubit>().passwordController.text,
      );
    }
  }
}

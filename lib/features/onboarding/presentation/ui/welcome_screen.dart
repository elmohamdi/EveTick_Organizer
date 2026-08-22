import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/core/widgets/outline_app_text_button.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/logo_and_hook.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/welcome_image.dart';
import 'package:evetick_organizer/features/onboarding/presentation/widgets/welcome_listener.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkBlue,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 812.h,
          child: Stack(
            children: [
              WelcomeImage(),
              Positioned(top: 300.h, left: 55.w, child: LogoAndHook()),
              Positioned(
                top: 500.h,
                left: 20.w,
                child: OutlineAppTextButton(
                  trailing: SvgPicture.asset(
                    'assets/svgs/google.svg',
                    height: 23.h,
                  ),
                  textStyle: TextStyles.font16WhiteMid(context),
                  buttonText: AppLocalizations.of(
                    context,
                  )!.authContinueWithGoogle,
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 565.h,
                left: 20.w,
                child: OutlineAppTextButton(
                  trailing: SvgPicture.asset(
                    'assets/svgs/facebook.svg',
                    height: 23.h,
                  ),
                  textStyle: TextStyles.font16WhiteMid(context),
                  buttonText: AppLocalizations.of(
                    context,
                  )!.authContinueWithFacebook,
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 630.h,
                left: 20.w,
                child: FilledAppTextButton(
                  buttonText: AppLocalizations.of(context)!.authSignIn,
                  onPressed: () {
                    context.pushNamed(Routes.loginScreen);
                  },
                ),
              ),
              WelcomeListener(),
              Positioned(
                top: 680.h,
                left: 0,
                right: 0,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      context.read<LoginCubit>().continueAsGuest();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.authContinueAsGuest,
                      style: TextStyles.font16LightGrayMid(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

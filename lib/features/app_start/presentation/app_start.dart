import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/features/app_start/logic/cubit/app_start_cubit.dart';
import 'package:evetick_organizer/features/app_start/logic/cubit/app_start_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStartScreen extends StatelessWidget {
  const AppStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppStartCubit, AppStartState>(
      listener: (context, state) {
        switch (state) {
          case AppStartGoToOnboarding():
            context.pushReplacedNamed(Routes.onBoardingScreen);
          case AppStartGoToWelcome():
            context.pushReplacedNamed(Routes.welcomeScreen);
          case AppStartGoToLogin():
            context.pushReplacedNamed(Routes.loginScreen);
          case AppStartGoToTerms():
            context.pushReplacedNamed(Routes.termsAcceptanceScreen);
          case AppStartGoToLocation():
            context.pushReplacedNamed(Routes.setLocationScreen);
          case AppStartGoToHome():
            context.pushReplacedNamed(Routes.homeScreen);
          case AppStartInitial() || AppStartLoading():
            break;
        }
      },
      child: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}

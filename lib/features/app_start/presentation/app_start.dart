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
        state.when(
          initial: () {},
          loading: () {},
          goToOnboarding: () {
            context.pushReplacedNamed(Routes.onBoardingScreen);
          },
          goToWelcome: () {
            context.pushReplacedNamed(Routes.welcomeScreen);
          },
          goToLogin: () {
            context.pushReplacedNamed(Routes.loginScreen);
          },
          goToHome: () {
            context.pushReplacedNamed(Routes.homeScreen);
          },
          goToLocation: () {
            context.pushReplacedNamed(Routes.setLocationScreen);
          },
        );
      },
      child: const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}

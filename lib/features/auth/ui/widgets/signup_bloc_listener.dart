import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/signup_cubit/signup_state.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/error_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            Center(
              child: CircularProgressIndicator(color: ColorsManager.orange),
            );
          },
          success: (data) {
            context.pushNamed(Routes.loginScreen);
          },
        );
      },
      builder: (context, state) {
        final errorMessage = state.whenOrNull(error: (error) => error);
        return ErrorBanner(message: errorMessage);
      },
    );
  }

  
}

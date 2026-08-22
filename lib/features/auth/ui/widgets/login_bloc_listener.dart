import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_state.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/error_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
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
            context.read<LoginCubit>().clearFields();
            context.pushNamed(Routes.appStartScreen);
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

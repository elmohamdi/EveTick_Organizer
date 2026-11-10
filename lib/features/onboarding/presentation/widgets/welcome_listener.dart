import 'package:evetick_organizer/core/helpers/extentions.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeListener extends StatelessWidget {
  const WelcomeListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            context.pushReplacedNamed(Routes.setLocationScreen);
          },
          error: (message) {
            AppToast.error(context, message);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}

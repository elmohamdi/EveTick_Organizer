import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_state.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/or_devider.dart';
import 'package:evetick_organizer/features/auth/ui/widgets/platform_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// "Or continue with Google" section. Needs a [LoginCubit] above it; success
/// and errors are handled by the screen's `LoginBlocListener`.
class LoginWithOtherPlatforms extends StatelessWidget {
  const LoginWithOtherPlatforms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDevider(),
        verticalSpace(24),
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) =>
              previous is Loading || current is Loading,
          builder: (context, state) {
            if (state is Loading) {
              return const SizedBox(
                height: 64,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => context.read<LoginCubit>().signInWithGoogle(),
                  child: const PlatformContainer(url: 'assets/svgs/google.svg'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

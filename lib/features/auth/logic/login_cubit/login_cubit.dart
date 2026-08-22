import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepo;
  LoginCubit(this.authRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading());
    final result = await authRepo.login(email: email, password: password);
    result.when(
      success: (user) {
        emit(LoginState.success(user));
      },
      failure: (failure) {
        emit(LoginState.error(error: failure.message));
      },
    );
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  void continueAsGuest() async {
    emit(const LoginState.loading());

    final result = await authRepo.continueAsGuest();

    result.when(
      success: (user) {
        emit(LoginState.success(user));
      },
      failure: (failure) {
        emit(LoginState.error(error: failure.message));
      },
    );
  }

  void logOut() async {
    await authRepo.logout();
  }
}

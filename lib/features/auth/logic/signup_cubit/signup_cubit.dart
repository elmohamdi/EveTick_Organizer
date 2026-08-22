
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/auth/logic/signup_cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepo;
  SignupCubit(this.authRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const SignupState.loading());
    final result = await authRepo.signup(
      name: name,
      email: email,
      password: password,
    );
    result.when(
      success: (user) {
        emit(SignupState.success(user));
      },
      failure: (failure) {
        emit(SignupState.error(error: failure.message));
      },
    );
  }
}

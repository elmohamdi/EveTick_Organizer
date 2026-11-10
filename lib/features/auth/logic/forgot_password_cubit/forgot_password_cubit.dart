import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/auth/logic/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._authRepository)
    : super(const ForgotPasswordInitial());

  final AuthRepository _authRepository;

  Future<void> sendResetLink(String email) async {
    if (state is ForgotPasswordLoading) return;
    emit(const ForgotPasswordLoading());

    final result = await _authRepository.sendPasswordResetEmail(email);
    if (isClosed) return;

    result.when(
      success: (_) => emit(const ForgotPasswordSuccess()),
      failure: (failure) => emit(ForgotPasswordError(failure.message)),
    );
  }
}

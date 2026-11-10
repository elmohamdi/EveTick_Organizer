import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/auth/data/models/reauth_method.dart';
import 'package:evetick_organizer/features/delete_account/logic/cubit/delete_account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this._authRepository)
    : super(const DeleteAccountInitial());

  final AuthRepository _authRepository;

  /// What the user has to do to confirm the deletion.
  ReauthMethod get reauthMethod => _authRepository.reauthMethod;

  /// [password] is only needed when [reauthMethod] is [ReauthMethod.password].
  Future<void> deleteAccount({String? password}) async {
    if (state is DeleteAccountLoading) return;
    emit(const DeleteAccountLoading());

    final result = await _authRepository.deleteAccount(password: password);
    if (isClosed) return;

    result.when(
      success: (_) => emit(const DeleteAccountSuccess()),
      failure: (failure) {
        // The user closed the Google sheet: not an error, just go back.
        if (failure.message == AuthRepository.signInCancelledMessage) {
          emit(const DeleteAccountInitial());
        } else {
          emit(DeleteAccountError(failure.message));
        }
      },
    );
  }
}

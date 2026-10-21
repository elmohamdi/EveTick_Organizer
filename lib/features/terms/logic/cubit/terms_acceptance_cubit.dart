import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_acceptance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Handles the Accept / Reject buttons of the first-time terms screen.
class TermsAcceptanceCubit extends Cubit<TermsAcceptanceState> {
  TermsAcceptanceCubit(this._authRepository)
    : super(const TermsAcceptanceInitial());

  final AuthRepository _authRepository;

  Future<void> accept() async {
    if (state is TermsAcceptanceLoading) return;
    emit(const TermsAcceptanceLoading());

    final result = await _authRepository.acceptTerms();
    if (isClosed) return;

    result.when(
      success: (_) => emit(const TermsAccepted()),
      failure: (failure) => emit(TermsAcceptanceError(failure.message)),
    );
  }

  /// Rejecting means the user cannot use the app: they are signed out.
  Future<void> reject() async {
    if (state is TermsAcceptanceLoading) return;
    emit(const TermsAcceptanceLoading());

    await _authRepository.logout();
    if (isClosed) return;

    emit(const TermsRejected());
  }
}

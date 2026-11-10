sealed class TermsAcceptanceState {
  const TermsAcceptanceState();
}

final class TermsAcceptanceInitial extends TermsAcceptanceState {
  const TermsAcceptanceInitial();
}

final class TermsAcceptanceLoading extends TermsAcceptanceState {
  const TermsAcceptanceLoading();
}

final class TermsAccepted extends TermsAcceptanceState {
  const TermsAccepted();
}

final class TermsRejected extends TermsAcceptanceState {
  const TermsRejected();
}

final class TermsAcceptanceError extends TermsAcceptanceState {
  const TermsAcceptanceError(this.message);

  final String message;
}

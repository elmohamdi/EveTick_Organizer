sealed class DeleteAccountState {
  const DeleteAccountState();
}

final class DeleteAccountInitial extends DeleteAccountState {
  const DeleteAccountInitial();
}

final class DeleteAccountLoading extends DeleteAccountState {
  const DeleteAccountLoading();
}

final class DeleteAccountSuccess extends DeleteAccountState {
  const DeleteAccountSuccess();
}

final class DeleteAccountError extends DeleteAccountState {
  const DeleteAccountError(this.message);

  final String message;
}

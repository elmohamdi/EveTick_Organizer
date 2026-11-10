/// How the signed-in user has to prove who they are before a sensitive
/// action (like deleting the account).
enum ReauthMethod {
  /// Signed in with Google: confirm through the Google sheet.
  google,

  /// Signed in with email and password: confirm by typing the password.
  password,

  /// Guest account: nothing to confirm with.
  none,
}

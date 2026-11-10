sealed class AppStartState {
  const AppStartState();

  const factory AppStartState.initial() = AppStartInitial;
  const factory AppStartState.loading() = AppStartLoading;
  const factory AppStartState.goToOnboarding() = AppStartGoToOnboarding;
  const factory AppStartState.goToLogin() = AppStartGoToLogin;
  const factory AppStartState.goToHome() = AppStartGoToHome;
  const factory AppStartState.goToLocation() = AppStartGoToLocation;
  const factory AppStartState.goToWelcome() = AppStartGoToWelcome;
  const factory AppStartState.goToTerms() = AppStartGoToTerms;
}

final class AppStartInitial extends AppStartState {
  const AppStartInitial();
}

final class AppStartLoading extends AppStartState {
  const AppStartLoading();
}

final class AppStartGoToOnboarding extends AppStartState {
  const AppStartGoToOnboarding();
}

final class AppStartGoToLogin extends AppStartState {
  const AppStartGoToLogin();
}

final class AppStartGoToHome extends AppStartState {
  const AppStartGoToHome();
}

final class AppStartGoToLocation extends AppStartState {
  const AppStartGoToLocation();
}

final class AppStartGoToWelcome extends AppStartState {
  const AppStartGoToWelcome();
}

final class AppStartGoToTerms extends AppStartState {
  const AppStartGoToTerms();
}

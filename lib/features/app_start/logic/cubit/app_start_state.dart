import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_start_state.freezed.dart';

@freezed
class AppStartState with _$AppStartState {
  const factory AppStartState.initial() = _Initial;
  const factory AppStartState.loading() = _Loading;
  const factory AppStartState.goToOnboarding() = _GoToOnboarding;
  const factory AppStartState.goToLogin() = _GoToLogin;
  const factory AppStartState.goToHome() = _GoToHome;
  const factory AppStartState.goToLocation() = _GoToLocation;
  const factory AppStartState.goToWelcome() = _GoToWelcome;
}

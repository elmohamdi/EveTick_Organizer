import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/features/app_start/logic/cubit/app_start_state.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/location/data/repos/location_repository.dart';
import 'package:evetick_organizer/features/onboarding/domain/onboarding_repository.dart';


class AppStartCubit extends Cubit<AppStartState> {
  final AuthRepository authRepository;
  final OnboardingRepository onboardingRepository;
  final LocationRepository locationRepository;

  AppStartCubit({
    required this.authRepository,
    required this.onboardingRepository,
    required this.locationRepository,
  }) : super(const AppStartState.initial());

  void checkAppStart() async {
    emit(const AppStartState.loading());

    final onboardingDone = await onboardingRepository.hasSeenOnboarding();

    if (!onboardingDone) {
      emit(const AppStartState.goToOnboarding());
      return;
    }

    final user = await authRepository.getCurrentUser();

    if (user == null) {
      emit(const AppStartState.goToWelcome());
      return;
    }

    final location = await locationRepository.getSavedLocation();

    if (location == null) {
      emit(const AppStartState.goToLocation());
      return;
    }

    emit(const AppStartState.goToHome());
  }
}

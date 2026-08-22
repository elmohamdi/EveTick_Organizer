import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/features/onboarding/domain/onboarding_repository.dart';
import 'package:evetick_organizer/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingRepository onboardingRepository;

  OnboardingCubit(this.onboardingRepository) : super(OnboardingInitial());

  Future<void> finishOnboarding() async {
    try {
      await onboardingRepository.markOnboardingAsSeen();
      emit(OnboardingFinished());
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/theming/data/theme_repository.dart';
import 'package:evetick_organizer/core/theming/logic/theme_cubit.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:evetick_organizer/features/localization/data/locale_repository.dart';
import 'package:evetick_organizer/features/localization/logic/locale_cubit.dart';
import 'package:evetick_organizer/features/location/data/repos/location_repository.dart';
import 'package:evetick_organizer/features/location/data/repos/location_repository_impl.dart';
import 'package:evetick_organizer/features/location/logic/cubit/location_cubit.dart';
import 'package:evetick_organizer/features/onboarding/data/onboarding_repository_impl.dart';
import 'package:evetick_organizer/features/onboarding/domain/onboarding_repository.dart';
import 'package:evetick_organizer/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:evetick_organizer/features/profile/data/profile_repository.dart';
import 'package:evetick_organizer/features/profile/logic/profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // auth
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(getIt<AuthRepository>()),
  );

  //onboarding
  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(),
  );

  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<OnboardingRepository>()),
  );

  // location
  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    ),
  );
  getIt.registerFactory<LocationCubit>(
    () => LocationCubit(locationRepository: getIt<LocationRepository>()),
  );

  // profile
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository());

  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(getIt<ProfileRepository>()),
  );

  // localization
  getIt.registerLazySingleton(() => LocaleRepository());

  getIt.registerLazySingleton(() => LocaleCubit(getIt()));

  // theme
  getIt.registerLazySingleton(() => ThemeRepository());
  getIt.registerLazySingleton(() => ThemeCubit(getIt()));
}

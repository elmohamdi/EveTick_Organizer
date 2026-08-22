

class AppRouter {
  // Route generateRoute(RouteSettings settings) {
  //   //this arguments to be passed in any screen like this (arguments as ClassName)
  //   final arguments = settings.arguments;

  //   switch (settings.name) {
  //     case Routes.onBoardingScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (context) => getIt<OnboardingCubit>(),
  //           child: const OnboardingScreen(),
  //         ),
  //       );
  //     case Routes.loginScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (context) => getIt<LoginCubit>(),
  //           child: const LoginScreen(),
  //         ),
  //       );
  //     case Routes.signupScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (context) => getIt<SignupCubit>(),
  //           child: const SignupScreen(),
  //         ),
  //       );
  //     case Routes.homeScreen:
  //       return MaterialPageRoute(builder: (_) => const HomeScreen());
  //     case Routes.verificationScreen:
  //       return MaterialPageRoute(builder: (_) => const VerificationScreen());
  //     case Routes.appStartScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider<AppStartCubit>(
  //           create: (context) => AppStartCubit(
  //             authRepository: getIt<AuthRepository>(),
  //             onboardingRepository: getIt<OnboardingRepository>(),
  //             locationRepository: getIt<LocationRepository>(),
  //           )..checkAppStart(),
  //           child: const AppStartScreen(),
  //         ),
  //       );
  //     case Routes.setLocationScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (context) =>
  //               LocationCubit(locationRepository: getIt<LocationRepository>()),
  //           child: SetLocation(),
  //         ),
  //       );
  //     case Routes.welcomeScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (_) => getIt<LoginCubit>(),
  //           child: const WelcomeScreen(),
  //         ),
  //       );
  //     case Routes.profileScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => MultiBlocProvider(
  //           providers: [
  //             BlocProvider(
  //               create: (context) => getIt<ProfileCubit>()..getUserData(),
  //             ),
  //             BlocProvider(create: (context) => getIt<LoginCubit>()),
  //           ],
  //           child: const ProfileScreen(),
  //         ),
  //       );
  //     case Routes.mapPickerScreen:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (context) => getIt<LocationCubit>(),
  //           child: MapPickerScreen(),
  //         ),
  //       );
  //     case Routes.editProfileScreen:
  //       final profileCubit = arguments as ProfileCubit;
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider.value(
  //           value: profileCubit,
  //           child: EditProfileScreen(),
  //         ),
  //       );
  //     default:
  //       return MaterialPageRoute(
  //         builder: (_) => Scaffold(
  //           body: Center(child: Text('No route defined for ${settings.name}')),
  //         ),
  //       );
  //   }
  // }
}

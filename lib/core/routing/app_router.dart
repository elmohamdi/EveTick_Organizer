import 'package:evetick_organizer/core/di/dependency_injection.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/features/app_start/logic/cubit/app_start_cubit.dart';
import 'package:evetick_organizer/features/app_start/presentation/app_start.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/auth/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:evetick_organizer/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:evetick_organizer/features/auth/ui/screens/login_screen.dart';
import 'package:evetick_organizer/features/auth/ui/screens/signup_screen.dart';
import 'package:evetick_organizer/features/auth/ui/screens/verification_screen.dart';
import 'package:evetick_organizer/features/create_event/logic/cubit/create_event_cubit.dart';
import 'package:evetick_organizer/features/create_event/presentation/screens/create_event_screen.dart';
import 'package:evetick_organizer/features/create_event/presentation/screens/publish_event_screen.dart';
import 'package:evetick_organizer/features/delete_account/logic/cubit/delete_account_cubit.dart';
import 'package:evetick_organizer/features/delete_account/presentation/screens/delete_account_screen.dart';
import 'package:evetick_organizer/features/event_dashboard/logic/cubit/event_dashboard_cubit.dart';
import 'package:evetick_organizer/features/event_dashboard/presentation/screens/event_dashboard_screen.dart';
import 'package:evetick_organizer/features/event_staff/logic/cubit/event_staff_cubit.dart';
import 'package:evetick_organizer/features/location/data/repos/location_repository.dart';
import 'package:evetick_organizer/features/location/logic/cubit/location_cubit.dart';
import 'package:evetick_organizer/features/location/presentation/screens/map_picker_screen.dart';
import 'package:evetick_organizer/features/location/presentation/screens/set_location.dart';
import 'package:evetick_organizer/features/notifications/presentation/models/notifications_route_args.dart';
import 'package:evetick_organizer/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:evetick_organizer/features/onboarding/domain/onboarding_repository.dart';
import 'package:evetick_organizer/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:evetick_organizer/features/onboarding/presentation/ui/onboarding_screen.dart';
import 'package:evetick_organizer/features/onboarding/presentation/ui/welcome_screen.dart';
import 'package:evetick_organizer/features/profile/logic/profile_cubit.dart';
import 'package:evetick_organizer/features/profile/ui/screens/edit_profile_screen.dart';
import 'package:evetick_organizer/features/profile/ui/screens/profile_screen.dart';
import 'package:evetick_organizer/features/support/data/models/support_category.dart';
import 'package:evetick_organizer/features/support/logic/help_support_cubit/help_support_cubit.dart';
import 'package:evetick_organizer/features/support/logic/send_message_cubit/send_message_cubit.dart';
import 'package:evetick_organizer/features/support/presentation/screens/help_support_screen.dart';
import 'package:evetick_organizer/features/support/presentation/screens/send_message_screen.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_acceptance_cubit.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_cubit.dart';
import 'package:evetick_organizer/features/terms/presentation/screens/terms_acceptance_screen.dart';
import 'package:evetick_organizer/features/terms/presentation/screens/terms_of_service_screen.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/screens/ticket_scan_screen.dart';
import 'package:evetick_organizer/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OnboardingCubit>(),
            child: const OnboardingScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<SignupCubit>()),
              BlocProvider(create: (context) => getIt<LoginCubit>()),
            ],
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const MainContainer());
      case Routes.verificationScreen:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case Routes.appStartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AppStartCubit>(
            create: (context) => AppStartCubit(
              authRepository: getIt<AuthRepository>(),
              onboardingRepository: getIt<OnboardingRepository>(),
              locationRepository: getIt<LocationRepository>(),
            )..checkAppStart(),
            child: const AppStartScreen(),
          ),
        );
      case Routes.setLocationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                LocationCubit(locationRepository: getIt<LocationRepository>()),
            child: SetLocation(),
          ),
        );
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const WelcomeScreen(),
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProfileCubit>()..getUserData(),
              ),
              BlocProvider(create: (context) => getIt<LoginCubit>()),
            ],
            child: const ProfileScreen(),
          ),
        );
      case Routes.mapPickerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LocationCubit>(),
            child: MapPickerScreen(),
          ),
        );
      case Routes.editProfileScreen:
        final profileCubit = arguments as ProfileCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: profileCubit,
            child: EditProfileScreen(),
          ),
        );
      case Routes.createEventScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<CreateEventCubit>(),
            child: const CreateEventScreen(),
          ),
        );
      case Routes.publishEventScreen:
        final args = arguments as Map<String, dynamic>? ?? {};
        return MaterialPageRoute(
          builder: (_) => PublishEventScreen(
            eventTitle: args['eventTitle'] as String? ?? 'Event Name',
            imagePath: args['imagePath'] as String?,
            startDate: args['startDate'] as DateTime? ?? DateTime.now(),
            startTime: args['startTime'] as TimeOfDay? ?? TimeOfDay.now(),
          ),
        );
      case Routes.ticketScanScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<TicketScanCubit>()..init(),
            child: const TicketScanScreen(),
          ),
        );
      case Routes.eventDashboardScreen:
        final eventId = arguments as String;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    getIt<EventDashboardCubit>(param1: eventId)..load(),
              ),
              BlocProvider(
                create: (_) =>
                    getIt<EventStaffCubit>(param1: eventId)..loadStaff(),
              ),
            ],
            child: const EventDashboardScreen(),
          ),
        );
      case Routes.helpSupportScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HelpSupportCubit>()..loadFaqs(),
            child: const HelpSupportScreen(),
          ),
        );
      case Routes.sendMessageScreen:
        // Optional: the topic picked on the Help & Support screen.
        final initialCategory = arguments as SupportCategory?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SendMessageCubit>(),
            child: SendMessageScreen(initialCategory: initialCategory),
          ),
        );
      case Routes.termsOfServiceScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<TermsCubit>()..load(),
            child: const TermsOfServiceScreen(),
          ),
        );
      case Routes.notificationsScreen:
        // The cubits are owned by MainContainer (the bell shows their badge).
        final args = arguments as NotificationsRouteArgs;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: args.notificationsCubit),
              BlocProvider.value(value: args.staffInvitesCubit),
              BlocProvider.value(value: args.pendingEventsCubit),
            ],
            child: const NotificationsScreen(),
          ),
        );
      case Routes.termsAcceptanceScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<TermsCubit>()..load()),
              BlocProvider(create: (_) => getIt<TermsAcceptanceCubit>()),
            ],
            child: const TermsAcceptanceScreen(),
          ),
        );
      case Routes.forgotPasswordScreen:
        // Optional: the email already typed on the login screen.
        final initialEmail = arguments as String?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ForgotPasswordCubit>(),
            child: ForgotPasswordScreen(initialEmail: initialEmail),
          ),
        );
      case Routes.deleteAccountScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<DeleteAccountCubit>(),
            child: const DeleteAccountScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

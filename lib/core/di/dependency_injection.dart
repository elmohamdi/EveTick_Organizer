import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/core/theming/data/theme_repository.dart';
import 'package:evetick_organizer/core/theming/logic/theme_cubit.dart';
import 'package:evetick_organizer/features/auth/data/auth_repository.dart';
import 'package:evetick_organizer/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:evetick_organizer/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:evetick_organizer/features/create_event/data/repositories/create_event_repository.dart';
import 'package:evetick_organizer/features/create_event/data/repositories/create_event_repository_impl.dart';
import 'package:evetick_organizer/features/create_event/logic/cubit/create_event_cubit.dart';
import 'package:evetick_organizer/features/event_dashboard/data/repositories/event_dashboard_repository.dart';
import 'package:evetick_organizer/features/event_dashboard/data/repositories/event_dashboard_repository_impl.dart';
import 'package:evetick_organizer/features/event_dashboard/logic/cubit/event_dashboard_cubit.dart';
import 'package:evetick_organizer/features/event_staff/data/repositories/event_staff_repository.dart';
import 'package:evetick_organizer/features/event_staff/data/repositories/event_staff_repository_impl.dart';
import 'package:evetick_organizer/features/event_staff/logic/cubit/event_staff_cubit.dart';
import 'package:evetick_organizer/features/home/data/repositories/home_repository.dart';
import 'package:evetick_organizer/features/home/data/repositories/home_repository_impl.dart';
import 'package:evetick_organizer/features/home/logic/cubit/home_cubit.dart';
import 'package:evetick_organizer/features/notifications/data/repositories/notifications_repository.dart';
import 'package:evetick_organizer/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_cubit.dart';
import 'package:evetick_organizer/features/pending_events/data/repositories/pending_events_repository.dart';
import 'package:evetick_organizer/features/pending_events/logic/cubit/pending_events_cubit.dart';
import 'package:evetick_organizer/features/staff_access/data/repositories/staff_access_repository.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_cubit.dart';
import 'package:evetick_organizer/features/support/data/repositories/support_repository.dart';
import 'package:evetick_organizer/features/support/data/repositories/support_repository_impl.dart';
import 'package:evetick_organizer/features/support/logic/help_support_cubit/help_support_cubit.dart';
import 'package:evetick_organizer/features/support/logic/send_message_cubit/send_message_cubit.dart';
import 'package:evetick_organizer/features/terms/data/repositories/terms_repository.dart';
import 'package:evetick_organizer/features/terms/data/repositories/terms_repository_impl.dart';
import 'package:evetick_organizer/features/terms/logic/cubit/terms_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/data/repositories/ticket_scan_repository.dart';
import 'package:evetick_organizer/features/ticket_scan/data/repositories/ticket_scan_repository_impl.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/services/scan_feedback_service.dart';
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
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

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
  //create Event
  getIt.registerLazySingleton<CreateEventRepository>(
    () => CreateEventRepositoryImpl(),
  );
  getIt.registerFactory<CreateEventCubit>(
    () => CreateEventCubit(createEventRepository: getIt()),
  );

  // staff access (invitations + events the user works on as staff)
  getIt.registerLazySingleton<StaffAccessRepository>(
    () => StaffAccessRepository(),
  );
  getIt.registerFactory<StaffInvitesCubit>(
    () => StaffInvitesCubit(getIt<StaffAccessRepository>()),
  );

  // notifications (live list of the user's notifications + the Home bell)
  getIt.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    ),
  );
  getIt.registerFactory<NotificationsCubit>(
    () => NotificationsCubit(getIt<NotificationsRepository>()),
  );

  // pending events
  getIt.registerLazySingleton<PendingEventsRepository>(
    () => PendingEventsRepository(staffAccess: getIt<StaffAccessRepository>()),
  );
  getIt.registerFactory<PendingEventsCubit>(
    () => PendingEventsCubit(getIt<PendingEventsRepository>()),
  );

  // event dashboard (one cubit per opened event -> eventId is a param)
  getIt.registerLazySingleton<EventDashboardRepository>(
    () => EventDashboardRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    ),
  );
  getIt.registerFactoryParam<EventDashboardCubit, String, void>(
    (eventId, _) =>
        EventDashboardCubit(getIt<EventDashboardRepository>(), eventId),
  );

  // home overview (stats across all of the organizer's events)
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
      dashboardRepository: getIt<EventDashboardRepository>(),
    ),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));

  // event staff
  getIt.registerLazySingleton<EventStaffRepository>(
    () => EventStaffRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    ),
  );
  getIt.registerFactoryParam<EventStaffCubit, String, void>(
    (eventId, _) => EventStaffCubit(getIt<EventStaffRepository>(), eventId),
  );

  // ticket scan
  getIt.registerLazySingleton<TicketScanRepository>(
    () => TicketScanRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
      staffAccess: getIt<StaffAccessRepository>(),
    ),
  );
  getIt.registerLazySingleton(() => const ScanFeedbackService());
  getIt.registerFactory<TicketScanCubit>(
    () => TicketScanCubit(
      getIt<TicketScanRepository>(),
      getIt<ScanFeedbackService>(),
    ),
  );

  // help & support (organizer FAQs + contact support)
  getIt.registerLazySingleton<SupportRepository>(
    () => SupportRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
      storage: FirebaseStorage.instance,
      picker: ImagePicker(),
    ),
  );
  getIt.registerFactory<HelpSupportCubit>(
    () => HelpSupportCubit(getIt<SupportRepository>()),
  );
  getIt.registerFactory<SendMessageCubit>(
    () => SendMessageCubit(getIt<SupportRepository>()),
  );

  // terms of service (read-only)
  getIt.registerLazySingleton<TermsRepository>(
    () => TermsRepositoryImpl(firestore: FirebaseFirestore.instance),
  );
  getIt.registerFactory<TermsCubit>(() => TermsCubit(getIt<TermsRepository>()));
}

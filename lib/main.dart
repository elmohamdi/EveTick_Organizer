import 'package:evetick_organizer/core/di/dependency_injection.dart';
import 'package:evetick_organizer/core/routing/app_router.dart';
import 'package:evetick_organizer/core/theming/logic/theme_cubit.dart';
import 'package:evetick_organizer/evetick_organizer_app.dart';
import 'package:evetick_organizer/features/localization/logic/locale_cubit.dart';
import 'package:evetick_organizer/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LocaleCubit>()..loadLocale()),
        BlocProvider(create: (context) => getIt<ThemeCubit>()..loadTheme()),
      ],
      child: EvetickOrganizerApp(appRouter: AppRouter()),
    );
  }
}

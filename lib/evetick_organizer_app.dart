import 'package:evetick_organizer/core/routing/app_router.dart';
import 'package:evetick_organizer/core/routing/routes.dart';
import 'package:evetick_organizer/core/theming/app_theme.dart';
import 'package:evetick_organizer/core/theming/logic/theme_cubit.dart';
import 'package:evetick_organizer/core/theming/logic/theme_state.dart';
import 'package:evetick_organizer/features/localization/logic/locale_cubit.dart';
import 'package:evetick_organizer/features/localization/logic/locale_state.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvetickOrganizerApp extends StatelessWidget {
  final AppRouter appRouter;
  const EvetickOrganizerApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, localeState) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return MaterialApp(
                  title: 'EveTick',
                  theme: themeState.themeMode == ThemeMode.light
                      ? AppTheme.lightTheme
                      : AppTheme.darkTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeState.themeMode,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: appRouter.generateRoute,
                  initialRoute: Routes.appStartScreen,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: localeState.locale,
                );
              },
            );
          },
        );
      },
    );
  }
}

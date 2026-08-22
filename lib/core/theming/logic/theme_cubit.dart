import 'package:evetick_organizer/core/theming/data/theme_repository.dart';
import 'package:evetick_organizer/core/theming/logic/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository repository;

  ThemeCubit(this.repository) : super(const ThemeState(ThemeMode.system));

  Future<void> loadTheme() async {
    final mode = await repository.getThemeMode();
    emit(ThemeState(mode));
  }

  Future<void> changeTheme(ThemeMode mode) async {
    await repository.saveThemeMode(mode);
    emit(ThemeState(mode));
  }
}

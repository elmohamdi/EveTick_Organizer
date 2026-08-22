import 'package:evetick_organizer/features/localization/data/locale_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final LocaleRepository repository;

  LocaleCubit(this.repository)
      : super(const LocaleState(Locale("en")));

  String get currentLanguageName =>
    state.locale.languageCode == 'ar'
        ? 'العربية'
        : 'English (US)';

  Future<void> loadLocale() async {
    final locale = await repository.getLocale();

    emit(LocaleState(locale));
  }

  Future<void> changeLanguage(String language) async {
    await repository.saveLocale(language);

    emit(LocaleState(Locale(language)));
  }
}
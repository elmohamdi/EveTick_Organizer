import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepository {
  static const _key = "language";

  Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();

    final language = prefs.getString(_key);

    if (language == null) {
      return const Locale("en");
    }

    return Locale(language);
  }

  Future<void> saveLocale(String language) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_key, language);
  }
}
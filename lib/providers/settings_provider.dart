import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/providers/settings_states.dart';
import 'package:news/shared/shared_preferences_service.dart';

class SettingsProvider extends Cubit<SettingsState> {
  ThemeMode themeMode = .system;
  String languageCode = 'en';

  SettingsProvider() : super(SettingsInitial()) {
    loadSettings();
  }

  bool get isDark => themeMode == .dark;

  bool get isArabic => languageCode == 'ar';

  void changeTheme(ThemeMode theme) {
    if (themeMode == theme) return;
    themeMode = theme;
    SharedPreferencesService.saveTheme(theme == .dark);
    emit(GetSettingsChangeTheme(themeMode));
  }

  void changeLanguage(String language) {
    if (languageCode == language) return;
    languageCode = language;
    SharedPreferencesService.saveLanguage(language);
    emit(GetSettingsChangeLanguage(language));
  }

  void loadSettings() {
    emit(GetSettingsLoading());
    bool isDark = SharedPreferencesService.getTheme();
    languageCode = SharedPreferencesService.getLanguage();
    themeMode = isDark ? .dark : .light;
    emit(GetSettingsLoaded(themeMode, languageCode));
  }
}

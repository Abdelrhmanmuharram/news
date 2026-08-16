import 'package:flutter/material.dart';
import 'package:news/shared_preferences_service.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = .system;
  String languageCode = 'en';

  SettingsProvider() {
    loadSettings();
  }

  bool get isDark => themeMode == .dark;

  bool get isArabic => languageCode == 'ar';

  void changeTheme(ThemeMode theme) {
    if (themeMode == theme) return;
    themeMode = theme;
    SharedPreferencesService.saveTheme(theme == .dark);
    notifyListeners();
  }

  void changeLanguage(String language) {
    if (languageCode == language) return;
    languageCode = language;
    SharedPreferencesService.saveLanguage(language);
    notifyListeners();
  }

  void loadSettings() {
    bool isDark = SharedPreferencesService.getTheme();
    languageCode = SharedPreferencesService.getLanguage();
    themeMode = isDark ? .dark : .light;
    notifyListeners();
  }
}

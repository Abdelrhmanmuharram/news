import 'package:flutter/material.dart';
import 'package:news/shared_preferences_service.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = .system;

  SettingsProvider() {
    loadSettings();
  }

  bool get isDark => themeMode == .dark;
  void changeTheme(ThemeMode theme) {
    if (themeMode == theme) return;
    themeMode = theme;
    SharedPreferencesService.saveTheme(theme == .dark);
    notifyListeners();
  }

  void loadSettings() {
    bool isDark = SharedPreferencesService.getTheme();
    themeMode = isDark ? .dark : .light;
    notifyListeners();
  }
}

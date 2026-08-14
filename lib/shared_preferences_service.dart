import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences prefe;
  static const String themeKey = 'theme';
  static const String languageKey = 'language';

  static Future<void> init() async {
    prefe = await SharedPreferences.getInstance();
  }

  static Future<void> saveTheme(bool isDark) async {
    await prefe.setBool(themeKey, isDark);
  }

  static bool getTheme() {
    return prefe.getBool(themeKey) ?? false;
  }

  static Future<void> saveLanguage(String languageCode) async {
    await prefe.setString(languageKey, languageCode);
  }

  static String getLanguage() {
    return prefe.getString(languageKey) ?? 'en';
  }
}

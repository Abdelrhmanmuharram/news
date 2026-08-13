import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences preferences;
  static const String themeKey = 'theme';

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveTheme(bool isDark) async {
    await preferences.setBool(themeKey, isDark);
  }

  static bool getTheme() {
    return preferences.getBool(themeKey) ?? false;
  }
}

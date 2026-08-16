import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF171717);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFA0A0A0);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarThemeData(
      backgroundColor: white,
      foregroundColor: black,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 20, color: black, fontWeight: .w500),
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 32, color: white, fontWeight: .bold),
      bodyLarge: TextStyle(fontSize: 20, color: white, fontWeight: .bold),
      titleLarge: TextStyle(fontSize: 24, color: black, fontWeight: .w500),
      titleMedium: TextStyle(fontSize: 18, color: black, fontWeight: .bold),
      titleSmall: TextStyle(fontSize: 16, color: black, fontWeight: .bold),
      labelMedium: TextStyle(fontSize: 14, color: white, fontWeight: .w500),
      labelLarge: TextStyle(fontSize: 12, color: gray, fontWeight: .w500),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarThemeData(
      backgroundColor: black,
      foregroundColor: white,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 20, color: white, fontWeight: .w500),
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 32, color: black, fontWeight: .bold),
      titleLarge: TextStyle(fontSize: 24, color: white, fontWeight: .w500),
      bodyLarge: TextStyle(fontSize: 20, color: white, fontWeight: .bold),
      titleMedium: TextStyle(fontSize: 18, color: white, fontWeight: .bold),
      titleSmall: TextStyle(fontSize: 16, color: white, fontWeight: .bold),
      labelMedium: TextStyle(fontSize: 14, color: white, fontWeight: .w500),
      labelLarge: TextStyle(fontSize: 12, color: gray, fontWeight: .w500),
    ),
  );
}

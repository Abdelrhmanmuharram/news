import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF171717);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFA0A0A0);

  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: black,
      foregroundColor: white,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 20, color: white, fontWeight: .w500),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 24, color: white, fontWeight: .w500),
      titleLarge: TextStyle(fontSize: 20, color: white, fontWeight: .w500),
      titleMedium: TextStyle(fontSize: 16, color: white, fontWeight: .w500),
      titleSmall: TextStyle(fontSize: 12, color: white, fontWeight: .w500),
    )
  );
}

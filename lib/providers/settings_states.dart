import 'package:flutter/material.dart';

class SettingsState {}

class SettingsInitial extends SettingsState {}

class GetSettingsChangeTheme extends SettingsState {
  ThemeMode themeMode;
  GetSettingsChangeTheme(this.themeMode);
}

class GetSettingsChangeLanguage extends SettingsState {
  String language;
  GetSettingsChangeLanguage(this.language);
}

class GetSettingsLoading extends SettingsState {}

class GetSettingsLoaded extends SettingsState {
  ThemeMode themeMode;
  String language;
  GetSettingsLoaded(this.themeMode, this.language);
}

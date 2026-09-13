import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/providers/settings_provider.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = context.read<SettingsProvider>();
    return Center(
      child: CircularProgressIndicator(
        color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,
      ),
    );
  }
}

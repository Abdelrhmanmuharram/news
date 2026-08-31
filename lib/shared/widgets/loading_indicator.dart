import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Center(
      child: CircularProgressIndicator(
        color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,
      ),
    );
  }
}

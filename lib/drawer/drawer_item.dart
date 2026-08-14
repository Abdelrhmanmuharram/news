import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/app_theme.dart';
import 'package:news/drawer/language_bottom_sheet.dart';
import 'package:news/drawer/theme_bottom_sheet.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class DrawerItem extends StatelessWidget {
  VoidCallback onGoToHomeClick;
  DrawerItem({super.key, required this.onGoToHomeClick});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    Size sizescreen = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: sizescreen.width * 0.7,
      color: AppTheme.black,
      child: Column(
        children: [
          Container(
            alignment: .center,
            height: sizescreen.height * .25,
            width: double.infinity,
            color: AppTheme.white,
            child: Text(
              appLocalizations.newsApp,
              style: textTheme.titleLarge!.copyWith(
                color: AppTheme.black,
                fontWeight: .bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    onGoToHomeClick();
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/home.svg',
                        width: 24,
                        height: 24,
                        fit: .scaleDown,
                      ),
                      SizedBox(width: 8),
                      Text(
                        appLocalizations.goToHome,
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: AppTheme.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Divider(),
                const SizedBox(height: 24),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/theme.svg',
                      width: 24,
                      height: 24,
                      fit: .scaleDown,
                    ),
                    SizedBox(width: 8),
                    Text(
                      appLocalizations.theme,
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      isScrollControlled: true,
                      builder: (context) {
                        return const ThemeBottomSheet();
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.white),
                    ),
                    child: Row(
                      children: [
                        Text(
                          settingsProvider.isDark
                              ? appLocalizations.dark
                              : appLocalizations.light,
                          style: textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                            color: AppTheme.white,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right_alt, color: AppTheme.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Divider(),
                const SizedBox(height: 24),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/language.svg',
                      width: 24,
                      height: 24,
                      fit: .scaleDown,
                    ),
                    SizedBox(width: 8),
                    Text(
                      appLocalizations.language,
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      isScrollControlled: true,
                      builder: (context) {
                        return const LanguageBottomSheet();
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.white),
                    ),
                    child: Row(
                      children: [
                        Text(
                          settingsProvider.isArabic
                              ? appLocalizations.arabic
                              : appLocalizations.english,
                          style: textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                            color: AppTheme.white,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right_alt, color: AppTheme.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

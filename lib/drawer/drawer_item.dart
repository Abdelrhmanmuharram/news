import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/app_theme.dart';
import 'package:news/l10n/app_localizations.dart';

class DrawerItem extends StatelessWidget {
  VoidCallback onGoToHomeClick;
  DrawerItem({super.key, required this.onGoToHomeClick});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
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
                        style: textTheme.titleMedium!.copyWith(fontSize: 20),
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
                      style: textTheme.titleMedium!.copyWith(fontSize: 20),
                    ),
                  ],
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
                      style: textTheme.titleMedium!.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

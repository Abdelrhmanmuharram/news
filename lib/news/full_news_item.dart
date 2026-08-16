import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/news_response/news.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FullNewsItem extends StatelessWidget {
  News news;
  FullNewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        clipBehavior: .antiAlias,
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,
        ),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            ClipRRect(
              clipBehavior: .antiAlias,
              borderRadius: BorderRadius.circular(16),
              child: Image.network(news.urlToImage!),
            ),
            const SizedBox(height: 8),
            Text(news.content!, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                openArticle(news.url!);
              },
              child: Text(appLocalizations.viewFullArticle),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openArticle(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

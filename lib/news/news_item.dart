import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news.dart';
import 'package:news/news/full_news_item.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          elevation: 0,
          isScrollControlled: true,
          builder: (context) {
            return FullNewsItem(news: news);
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,
          ),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              child: news.urlToImage!.isEmpty
                  ? const Center(child: LoadingIndicator())
                  : Image.network(
                      news.urlToImage!,
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      loadingBuilder: (_, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          width: double.infinity,
                          child: const Center(child: LoadingIndicator()),
                        );
                      },
                      errorBuilder: (_, _, _) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.25,
                          width: double.infinity,
                          child: Image.network(
                            'https://media.istockphoto.com/id/1980276924/vector/no-photo-thumbnail-graphic-element-no-found-or-available-image-in-the-gallery-or-album-flat.jpg?s=612x612&w=0&k=20&c=ZBE3NqfzIeHGDPkyvulUw14SaWfDj2rZtyiKv3toItk=',
                            fit: .cover,
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 10),
            Text(news.title ?? '', style: textTheme.titleSmall),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'By: ${news.author ?? ''}',
                    overflow: .ellipsis,
                    style: textTheme.labelLarge,
                  ),
                ),
                Spacer(),
                Text(
                  timeago.format(
                    news.publishedAt!,
                    locale: settingsProvider.isArabic ? 'ar' : 'en',
                  ),
                  style: textTheme.labelLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

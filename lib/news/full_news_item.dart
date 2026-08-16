import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news.dart';

class FullNewsItem extends StatelessWidget {
  News news;
  FullNewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        clipBehavior: .antiAlias,
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppTheme.white,
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
            Text(news.content!),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, child: Text('View Full Articel')),
          ],
        ),
      ),
    );
  }
}

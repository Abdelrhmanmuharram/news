import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    DateTime dateTime = DateTime.now().subtract(Duration(minutes: 581));
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            clipBehavior: .antiAlias,
            child: Image.asset(
              'assets/images/photo.png',
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: .fill,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
            style: textTheme.titleSmall,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('By: Muharram', style: textTheme.labelLarge),
              Spacer(),
              Text(timeago.format(dateTime), style: textTheme.labelLarge),
            ],
          ),
        ],
      ),
    );
  }
}

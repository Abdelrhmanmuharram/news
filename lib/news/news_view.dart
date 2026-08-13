import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/source_model.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/news_tab_item.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  String categoryId;
  NewsView({super.key, required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  List<SourceModel> sources = List.generate(
    10,
    (index) => SourceModel(id: "index", name: "Source $index"),
  );
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            tabAlignment: .start,
            indicatorColor: settingsProvider.isDark
                ? AppTheme.white
                : AppTheme.black,
            tabs: sources
                .map(
                  (source) => NewsTabItem(
                    isSelected: currentIndex == sources.indexOf(source),
                    source: source,
                  ),
                )
                .toList(),
            labelPadding: EdgeInsetsGeometry.directional(start: 16),
            onTap: (index) {
              if (currentIndex == index) return;
              currentIndex = index;
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsetsGeometry.directional(
              top: 16,
              start: 16,
              end: 16,
            ),
            itemBuilder: (_, index) => NewsItem(),
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

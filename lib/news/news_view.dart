import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news.dart';
import 'package:news/models/sources_response/source.dart';
import 'package:news/models/sources_response/sources_response.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/news_tab_item.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  String categoryId;
  NewsView({super.key, required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  late Future<SourcesResponse> getSourcesFuture;

  @override
  void initState() {
    super.initState();
    getSourcesFuture = ApiService.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return FutureBuilder(
      future: getSourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == .waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          List<Source> sources = snapshot.data?.sources ?? [];
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
                child: FutureBuilder(
                  future: ApiService.getNews(sources[currentIndex].id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == .waiting) {
                      return LoadingIndicator();
                    } else if (snapshot.hasError ||
                        snapshot.data!.status != 'ok') {
                      return ErrorIndicator();
                    } else {
                      List<News> newsList = snapshot.data?.newsList ?? [];
                      return ListView.separated(
                        padding: EdgeInsetsGeometry.directional(
                          top: 16,
                          start: 16,
                          end: 16,
                        ),
                        itemBuilder: (_, index) =>
                            NewsItem(news: newsList[index]),
                        separatorBuilder: (_, _) => SizedBox(height: 16),
                        itemCount: newsList.length,
                      );
                    }
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

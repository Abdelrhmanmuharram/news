import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/model/news.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/sources/view/widgets/news_tab_item.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  final String? categoryId;
  final List<News>? searchResult;
  const NewsView({super.key, this.categoryId, this.searchResult});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    if (widget.searchResult != null) {
      List<News> newsList = widget.searchResult!;
      return ListView.separated(
        padding: EdgeInsetsGeometry.directional(top: 16, start: 16, end: 16),
        itemBuilder: (_, index) => NewsItem(news: newsList[index]),
        separatorBuilder: (_, _) => SizedBox(height: 16),
        itemCount: newsList.length,
      );
    }
    return ChangeNotifierProvider(
      create: (_) =>
          SourcesViewModel(ServiceLocator.sourceRepository)
            ..getSources(widget.categoryId!),
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, _) {
          if (viewModel.isLoading) {
            return LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(message: viewModel.errorMessage!);
          } else {
            List<Source> sources = viewModel.sources;
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
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ChangeNotifierProvider(
                    key: ValueKey(sources[currentIndex].id),
                    create: (_) =>
                        NewsViewModel(ServiceLocator.newsRepository)..getNews(sources[currentIndex].id!),
                    child: Consumer<NewsViewModel>(
                      builder: (_, newsVm, _) {
                        if (newsVm.isLoading) {
                          return LoadingIndicator();
                        } else if (newsVm.errorMessage != null) {
                          return ErrorIndicator();
                        } else {
                          List<News> newsList = newsVm.news;
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
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

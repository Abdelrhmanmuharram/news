import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view_model/news_states.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/model/news.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/news/view/widgets/news_item.dart';
import 'package:news/sources/view/widgets/news_tab_item.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:news/sources/view_model/sources_states.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';

class NewsView extends StatefulWidget {
  final String? categoryId;
  final List<News>? searchResult;
  const NewsView({super.key, this.categoryId, this.searchResult});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  SourcesViewModel sourcesViewModel = SourcesViewModel(
    ServiceLocator.sourceRepository,
  );
  @override
  void initState() {
    super.initState();
    sourcesViewModel.getSources(widget.categoryId!);
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = context.read<SettingsProvider>();

    if (widget.searchResult != null) {
      List<News> newsList = widget.searchResult!;
      return ListView.separated(
        padding: EdgeInsetsGeometry.directional(top: 16, start: 16, end: 16),
        itemBuilder: (_, index) => NewsItem(news: newsList[index]),
        separatorBuilder: (_, _) => SizedBox(height: 16),
        itemCount: newsList.length,
      );
    }
    return BlocProvider(
      create: (_) => sourcesViewModel,
      child: BlocBuilder<SourcesViewModel, SourcesState>(
        builder: (_, state) {
          if (state is GetSourcesLodaing) {
            return LoadingIndicator();
          } else if (state is GetSourcesError) {
            return ErrorIndicator(message: state.message);
          } else if (state is GetSourcesSuccess) {
            List<Source> sources = state.sources;
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
                  child: BlocProvider(
                    key: ValueKey(sources[currentIndex].id),
                    create: (_) =>
                        NewsViewModel(ServiceLocator.newsRepository)
                          ..getNews(sources[currentIndex].id!),
                    child: BlocBuilder<NewsViewModel, NewsState>(
                      builder: (_, state) {
                        if (state is GetNewsLoading) {
                          return LoadingIndicator();
                        } else if (state is GetNewsError) {
                          return ErrorIndicator();
                        } else if (state is GetNewsSuccess) {
                          List<News> newsList = state.news;
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
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

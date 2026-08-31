import 'package:flutter/material.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/model/news.dart';
import 'package:news/news/data/model/news_response.dart';

class NewsViewModel with ChangeNotifier {
  NewsDataSource dataSource = NewsDataSource();
  List<News> news = [];
  List<News> search = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    try {
      NewsResponse response = await dataSource.getNews(sourceId);
      if (response.status == 'ok' && response.newsList != null) {
        news = response.newsList!;
      } else {
        errorMessage = 'Failed to get News';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchNews(String query) async {
    isLoading = true;
    try {
      NewsResponse response = await dataSource.searchNews(query);
      if (response.status == 'ok' && response.newsList != null) {
        search = response.newsList!;
      } else {
        errorMessage = 'No result';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

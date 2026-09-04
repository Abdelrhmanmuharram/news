import 'package:flutter/material.dart';
import 'package:news/news/data/model/news.dart';
import 'package:news/news/data/repositories/news_repository.dart';

class NewsViewModel with ChangeNotifier {
  NewsRepository repository;
  NewsViewModel(this.repository);
  List<News> news = [];
  List<News> search = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    try {
      news = await repository.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchNews(String query) async {
    isLoading = true;
    try {
      search = await repository.searchNews(query);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

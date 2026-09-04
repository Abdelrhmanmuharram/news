import 'package:news/news/data/model/news.dart';

abstract class NewsDataSource {
  Future<List<News>> getNews(String sourceId);
  Future<List<News>> searchNews(String query);
}

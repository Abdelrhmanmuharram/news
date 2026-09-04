import 'package:news/news/data/data_sources/news_api_data_source.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/model/news.dart';

class NewsRepository {
  NewsDataSource dataSource = NewsAPIDataSource();
  Future<List<News>> getNews(String sourceId) async {
    return dataSource.getNews(sourceId);
  }

  Future<List<News>> searchNews(String query) async {
    return dataSource.searchNews(query);
  }
}

import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/model/news.dart';

class NewsRepository {
  NewsDataSource dataSource;
  NewsRepository(this.dataSource);
  Future<List<News>> getNews(String sourceId) async {
    return dataSource.getNews(sourceId);
  }

  Future<List<News>> searchNews(String query) async {
    return dataSource.searchNews(query);
  }
}

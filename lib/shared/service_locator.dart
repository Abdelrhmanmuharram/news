import 'package:news/news/data/data_sources/news_api_data_source.dart';
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/sources/data/data_sources/sources_api_data_source.dart';
import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/repositories/source_repository.dart';
import 'package:news/sources/view_model/sources_view_model.dart';

class ServiceLocator {
  static SourcesDataSource sourcesDataSource = SourcesAPIDataSource();
  static SourceRepository sourceRepository = SourceRepository(
    sourcesDataSource,
  );
  static SourcesViewModel sourcesViewModel = SourcesViewModel(sourceRepository);

  static NewsDataSource newsDataSource = NewsAPIDataSource();
  static NewsRepository newsRepository = NewsRepository(newsDataSource);
  static NewsViewModel newsViewModel = NewsViewModel(newsRepository);
}

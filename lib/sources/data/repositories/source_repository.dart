import 'package:news/sources/data/data_sources/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';

class SourceRepository {
  SourcesDataSource dataSource;
  SourceRepository(this.dataSource);

  Future<List<Source>> getSources(String categoryId) async {
    return dataSource.getSources(categoryId);
  }
}

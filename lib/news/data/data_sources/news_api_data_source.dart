import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news/data/data_sources/news_data_source.dart';
import 'package:news/news/data/model/news.dart';
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/model/news_response.dart';

class NewsAPIDataSource implements NewsDataSource {
  @override
  Future<List<News>> getNews(String sourceId) async {
    Uri uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.newsList != null) {
      return newsResponse.newsList!;
    } else {
      throw Exception('Failed to get News');
    }
  }

  @override
  Future<List<News>> searchNews(String query) async {
    Uri uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'q': query,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.newsList != null) {
      return newsResponse.newsList!;
    } else {
      throw Exception('No result');
    }
  }
}

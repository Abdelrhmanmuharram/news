import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/news/data/model/news_response.dart';

class NewsDataSource {
  Future<NewsResponse> getNews(String sourceId) async {
    Uri uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  Future<NewsResponse> searchNews(String query) async {
    Uri uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'q': query,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}

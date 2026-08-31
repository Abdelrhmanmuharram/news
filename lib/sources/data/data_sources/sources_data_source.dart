import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/sources/data/models/sources_response.dart';

class SourcesDataSource {
  Future<SourcesResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConstants.baseURL, ApiConstants.sourceEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
}

import 'package:flutter/material.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/data/repositories/source_repository.dart';

class SourcesViewModel with ChangeNotifier {
  SourceRepository repository = SourceRepository();
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      sources = await repository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}

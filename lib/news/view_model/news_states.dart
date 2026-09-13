import 'package:news/news/data/model/news.dart';

class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsLoading extends NewsState {}

class GetNewsSuccess extends NewsState {
  List<News> news;
  GetNewsSuccess(this.news);
}

class GetNewsError extends NewsState {
  String message;
  GetNewsError(this.message);
}

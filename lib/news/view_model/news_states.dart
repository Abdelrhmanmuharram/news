import 'package:news/news/data/model/news.dart';

class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsLoading extends NewsState {}

class GetNewsSuccess extends NewsState {
  List<News> news;
  bool isLoadingMore;
  GetNewsSuccess(this.news, {this.isLoadingMore = false});
}

class GetNewsError extends NewsState {
  String message;
  GetNewsError(this.message);
}

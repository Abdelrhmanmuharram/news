import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/model/news.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/news/view_model/news_states.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsRepository repository;
  NewsViewModel(this.repository) : super(NewsInitial());

  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      List<News> news = await repository.getNews(sourceId);
      emit(GetNewsSuccess(news));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }

  Future<void> searchNews(String query) async {
    emit(GetNewsLoading());
    try {
      List<News> search = await repository.searchNews(query);
      emit(GetNewsSuccess(search));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}

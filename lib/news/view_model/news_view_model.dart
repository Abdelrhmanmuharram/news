import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/model/news.dart';
import 'package:news/news/data/repositories/news_repository.dart';
import 'package:news/news/view_model/news_states.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsRepository repository;

  NewsViewModel(this.repository) : super(NewsInitial());

  int currentPage = 1;
  int pageSize = 4;
  List<News> news = [];
  bool isLoadingMore = false;

  Future<void> getNews(String sourceId) async {
    if (isLoadingMore) return;
    if (currentPage == 1) {
      emit(GetNewsLoading());
    } else {
      isLoadingMore = true;
      emit(GetNewsSuccess(news, isLoadingMore: true));
    }
    try {
      List<News> newsList = await repository.getNews(
        sourceId,
        currentPage,
        pageSize,
      );
      news.addAll(newsList);
      currentPage++;
      isLoadingMore = false;
      emit(GetNewsSuccess(news));
    } catch (error) {
      isLoadingMore = false;
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

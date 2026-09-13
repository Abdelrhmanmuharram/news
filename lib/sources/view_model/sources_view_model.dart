import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/data/repositories/source_repository.dart';
import 'package:news/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  SourceRepository repository;
  SourcesViewModel(this.repository) : super(SourcesInitial());

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLodaing());
    try {
      List<Source> sources = await repository.getSources(categoryId);
      emit(GetSourcesSuccess(sources));
    } catch (error) {
      emit(GetSourcesError(error.toString()));
    }
  }
}

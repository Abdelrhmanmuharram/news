import 'package:news/sources/data/models/source.dart';

abstract class SourcesState {}

class SourcesInitial extends SourcesState {}

class GetSourcesLodaing extends SourcesState {}

class GetSourcesSuccess extends SourcesState {
  List<Source> sources;
  GetSourcesSuccess(this.sources);
}

class GetSourcesError extends SourcesState {
  String message;
  GetSourcesError(this.message);
}

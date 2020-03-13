part of 'search_headlines_bloc.dart';

abstract class SearchHeadlinesEvent extends Equatable {
  const SearchHeadlinesEvent();
}

class LoadSearchHeadlines implements SearchHeadlinesEvent{
  final String  _query;

  LoadSearchHeadlines(this._query);
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  // TODO: implement stringify
  bool get stringify => null;
  
}

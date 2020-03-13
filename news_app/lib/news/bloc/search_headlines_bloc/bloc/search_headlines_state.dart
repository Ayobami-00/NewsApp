part of 'search_headlines_bloc.dart';

abstract class SearchHeadlinesState extends Equatable {
  const SearchHeadlinesState();
}

class SearchHeadlinesInitial extends SearchHeadlinesState {
  @override
  List<Object> get props => [];
}

class SearchHeadlinesLoaded extends SearchHeadlinesState {
  final NewsModel newsModel;

  SearchHeadlinesLoaded(this.newsModel);

  
  @override
  List<Object> get props => [newsModel];
}

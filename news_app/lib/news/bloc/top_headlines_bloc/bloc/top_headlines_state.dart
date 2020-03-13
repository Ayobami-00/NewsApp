part of 'top_headlines_bloc.dart';

abstract class TopHeadlinesState extends Equatable {
  const TopHeadlinesState();
}

class TopHeadlinesInitial extends TopHeadlinesState {
  @override
  List<Object> get props => [];
}

class TopHeadlinesLoaded extends TopHeadlinesState {
  final NewsModel newsModel;

  TopHeadlinesLoaded(this.newsModel);

  
  @override
  List<Object> get props => [newsModel];
}

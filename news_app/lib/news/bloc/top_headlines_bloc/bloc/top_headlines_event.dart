part of 'top_headlines_bloc.dart';

abstract class TopHeadlinesEvent extends Equatable {
  const TopHeadlinesEvent();
}

class LoadTopHeadlines implements TopHeadlinesEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  // TODO: implement stringify
  bool get stringify => null;
  
}
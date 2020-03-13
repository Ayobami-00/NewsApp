import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/news/data/news_api_provider.dart';
import 'package:news_app/news/models/news_model.dart';

part 'top_headlines_event.dart';
part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  final _newsApiProvider = NewsApiProvider();
  @override
  TopHeadlinesState get initialState => TopHeadlinesInitial();

  @override
  Stream<TopHeadlinesState> mapEventToState(
    TopHeadlinesEvent event,
  ) async* {
    if(event is LoadTopHeadlines){
      NewsModel newsModel =
          await _newsApiProvider.fetchTopHeadlines();
        yield(TopHeadlinesLoaded(newsModel));
      
    }
  }
}

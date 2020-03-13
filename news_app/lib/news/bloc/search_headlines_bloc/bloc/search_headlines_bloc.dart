import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/news/data/news_api_provider.dart';
import 'package:news_app/news/models/news_model.dart';

part 'search_headlines_event.dart';
part 'search_headlines_state.dart';

class SearchHeadlinesBloc extends Bloc<SearchHeadlinesEvent, SearchHeadlinesState> {
  final _newsApiProvider = NewsApiProvider();
  @override
  SearchHeadlinesState get initialState => SearchHeadlinesInitial();

  @override
  Stream<SearchHeadlinesState> mapEventToState(
    SearchHeadlinesEvent event,
  ) async* {
    if(event is LoadSearchHeadlines){
      NewsModel newsModel =
          await _newsApiProvider.fetchBySearch(event._query);
        yield(SearchHeadlinesLoaded(newsModel));
      
    }
  }
}

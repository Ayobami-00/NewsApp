import 'package:flutter/material.dart';
import 'package:news_app/news/bloc/top_headlines_bloc/bloc/top_headlines_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/models/news_model.dart';
import 'package:news_app/news/ui/pages/top_headlines_detail_page.dart';
import 'package:news_app/news/ui/pages/views/card_view.dart';
import 'package:news_app/news/ui/pages/views/loading.dart';

class TopHeadLinesPage extends StatefulWidget {
  @override
  _TopHeadLinesPageState createState() => _TopHeadLinesPageState();
}

class _TopHeadLinesPageState extends State<TopHeadLinesPage> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Immediately trigger the event
    BlocProvider.of<TopHeadlinesBloc>(context).add(LoadTopHeadlines());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TopHeadlinesBloc, TopHeadlinesState>(
      listener: (context, state) {},
      child: BlocBuilder<TopHeadlinesBloc, TopHeadlinesState>(
        builder: (context, state) {
          if (state is TopHeadlinesInitial) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Loading(),
            );
          } else if (state is TopHeadlinesLoaded) {
            NewsModel newsModel = state.newsModel;
            return Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 75.0),
                child: GridView.builder(
                  itemCount: newsModel.articles.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                      childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          return Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => TopHeadLinesDetailPage()));
                        },
                        child: CardView(
                            articles: newsModel.articles, index: index));
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

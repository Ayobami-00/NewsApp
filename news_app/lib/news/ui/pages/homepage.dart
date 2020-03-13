import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/bloc/top_headlines_bloc/bloc/top_headlines_bloc.dart';
import 'package:news_app/news/ui/pages/top_headlines.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                backgroundColor: Colors.deepOrange,
                title: Text("News App"),
                pinned: false,
                expandedHeight: 120.0,
                bottom: new TabBar(
                  isScrollable: true,
                  tabs: [
                    new Tab(text: 'Top Headlines'),
                    new Tab(text: 'Search Headlines'),
                  ],
                  controller: controller,
                ),
              ),
              new SliverFillRemaining(
                child: TabBarView(
                  controller: controller,
                  children: <Widget>[
                    BlocProvider(
                    create: (context) => TopHeadlinesBloc(),
                    child: TopHeadLinesPage()),
                    Text("Tab 4"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:news_app/news/models/news_model.dart';

class CardView extends StatefulWidget {
  final List<Articles> articles;
  final int index;

  const CardView({Key key, this.articles, this.index}) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
            Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.network(widget.articles[widget.index].urlToImage)
                    ),
                  ],
                ),
              ),
        Container(
          height: 50.0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        widget.articles[widget.index].articleName,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
      ],
    ));

  }
}

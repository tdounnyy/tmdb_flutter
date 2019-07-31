import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';

/**
 * TODO
 * - People
 * - Posters
 * - Reviews
 */
class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({Key key, this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Placeholder(
                fallbackWidth: 90,
                fallbackHeight: 160,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "title",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    "popular",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "genres",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "language",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "date",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ],
          ),
          Text("movie desc"),
          Text("people portrait gallery"),
          Text("status"),
        ],
      ),
    );
  }
}

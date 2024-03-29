import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';

import 'widgets/widgets.dart';

/**
 * TODO
 * - movie detail
 * - like movie
 * - movie gallery
 * - People page
 * - Search movie & people
 * - Search filter
 */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          '/': (context) => PopularMovieList(title: "Popular"),
          '/detail': (context) => MovieDetailPage(settings.arguments as Movie),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}

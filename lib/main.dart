import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';

import 'pages/pages.dart';

/**
 * TODO
 * - movie detail
 * - like movie
 * - movie gallery
 * - Person page
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
          '/': (context) => PopularMoviePage(title: "Popular"),
          '/detail': (context) => MovieDetailPage(settings.arguments as int),
          '/personDetail': (context) =>
              PersonDetailPage(settings.arguments as int)
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}

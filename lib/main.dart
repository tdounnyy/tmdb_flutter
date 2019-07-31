import 'package:flutter/material.dart';

import 'entity/entities.dart';
import 'repo/repos.dart';
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
      home: MyHomePage(title: 'TMDB Popular'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> _movies;

  MovieRepo _movieRepo;

  @override
  void initState() {
    super.initState();
    _movieRepo = MovieRepo.instance();
  }

  void _refreshMovies() async {
    _movies = await _movieRepo.mockPopular().then((v) => v.results);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: _movies == null
              ? EmptyView()
              : ListView.builder(itemBuilder: _movieListBuilder)),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshMovies,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _movieListBuilder(BuildContext context, int index) {
    if (index >= _movies.length) {
      return null;
    }
    return Container(
      child: MovieCard(_movies[index]),
      color: Colors.green,
    );
  }
}

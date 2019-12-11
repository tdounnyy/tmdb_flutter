import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/persist/FavoritePersist.dart';
import 'package:tmdb/repo/repos.dart';
import 'package:tmdb/widgets/widgets.dart';

class PopularMoviePage extends StatefulWidget {
  PopularMoviePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PopularMoviePageState createState() => _PopularMoviePageState();
}

class _PopularMoviePageState extends State<PopularMoviePage> {
  List<Movie> _movies;

  MovieRepo _movieRepo;

  @override
  void initState() {
    super.initState();
    _movieRepo = MovieRepo.instance();
  }

  void _refreshMovies() async {
    _movies = await _movieRepo.popular().then((v) => v.results);
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
      child: MovieCard(_movies[index], _onMovieTap),
    );
  }

  void _onMovieTap(BuildContext context, Movie movie) {
    print("onMovieTap ${movie.title}");
    Navigator.of(context).pushNamed('/detail', arguments: movie.id);
  }
}

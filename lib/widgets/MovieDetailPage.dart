import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';

/**
 * TODO
 * - People
 * - Posters
 * - Reviews
 */
class MovieDetailPage extends StatefulWidget {
  MovieDetailPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieDetailPageState();
  }
}

class MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetailPageState();

  int movie_id;
  Movie _movie;

  final repo = ImageRepo.instance();

  @override
  Widget build(BuildContext context) {
    // TODO: getting args in here is bad
    Map<String, num> args = ModalRoute.of(context).settings.arguments;
    movie_id = args['id'];
    if (_movie == null) {
      return Scaffold(
        body: Center(
          child: Text("Need a golden touch"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _getDetail,
          tooltip: 'Increment',
          child: Icon(Icons.refresh),
        ),
      );
    }

    var moviePoster = repo.buildImageUrl(_movie.poster_path);
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie detail"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDetail,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: moviePoster,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _movie.title,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      _movie.popularity.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      List.of(_movie.genre_list).map((i) => i.name).join("#"),
                    ),
                    Text(
                      _movie.original_language,
                    ),
                    Text(
                      _movie.release_date,
                    ),
                    Text(_movie.adult ? "18+" : "3+"),
                  ],
                ),
              ],
            ),
            Text(
              _movie.overview,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text("people portrait gallery"),
          ],
        ),
      ),
    );
  }

  void _getDetail() async {
    _movie = await MovieRepo.instance().movieDetail(movie_id);
    print("getDetail ${_movie.title}");
    setState(() {});
  }
}

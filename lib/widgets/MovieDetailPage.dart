import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';
import 'package:tmdb/widgets/widgets.dart';

/**
 * TODO
 * - People
 * - Posters
 * - Reviews
 */
class MovieDetailPage extends StatefulWidget {
  MovieDetailPage(this.movie, {Key key}) : super(key: key);

  final Movie movie;

  @override
  State<StatefulWidget> createState() {
    return MovieDetailPageState(movie);
  }
}

class MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetailPageState(this.movie);

  Movie movie;

  @override
  void initState() {
    super.initState();
    _getDetail();
  }

  @override
  Widget build(BuildContext context) {
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
            MovieDetailHeader(movie),
            Text(
              movie.overview,
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
    movie = await MovieRepo.instance().movieDetail(movie.id);
    var cast = await MovieRepo.instance().movieCast(movie.id);
    print("getDetail movie: ${movie.title} & casts: ${cast.length}");
    setState(() {});
  }
}

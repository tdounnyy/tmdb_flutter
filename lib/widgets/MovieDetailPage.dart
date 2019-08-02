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
  MovieDetailPage({Key key, this.movie}) : super(key: key);

  Movie movie;

  @override
  State<StatefulWidget> createState() {
    return MovieDetailPageState(movie: movie);
  }
}

class MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetailPageState({this.movie});

  Movie movie;

  final repo = ImageRepo.instance();

  @override
  void initState() {
    super.initState();
    _getDetail();
  }

  @override
  Widget build(BuildContext context) {
    var moviePoster = repo.buildImageUrl(movie.poster_path);
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
                Hero(
                  tag: "hero_${movie.id}",
                  child: CachedNetworkImage(
                    imageUrl: moviePoster,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      movie.popularity.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      List.of(movie.genre_list ?? [])
                          .map((i) => i.name)
                          .join("#"),
                    ),
                    Text(
                      movie.original_language,
                    ),
                    Text(
                      movie.release_date,
                    ),
                    Text(movie.adult ? "18+" : "3+"),
                  ],
                ),
              ],
            ),
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
    print("getDetail ${movie.title}");
    setState(() {});
  }
}

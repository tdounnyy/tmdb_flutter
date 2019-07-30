import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    var repo = ImageRepo.instance();
    var moviePoster = repo.buildImageUrl(movie.poster_path);
    print("image = $moviePoster");
    return Card(
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: moviePoster,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white60,
                    child: Row(
                      children: <Widget>[
                        Text(
                          movie.title,
                        ),
                        Spacer(),
                        Text(
                          movie.popularity.toString(),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    color: Colors.white60,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      movie.overview,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

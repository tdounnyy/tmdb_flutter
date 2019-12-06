import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';
import 'package:tmdb/widgets/LikeButton.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function tapCallback;

  MovieCard(this.movie, this.tapCallback);

  @override
  Widget build(BuildContext context) {
    var repo = ImageRepo.instance();
    var moviePoster = repo.buildImageUrl(movie.posterPath);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Hero(
              tag: "hero_${movie.id}",
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: moviePoster,
              ),
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
                        Spacer(flex: 1),
                        Text(
                          "🔥 ${movie.popularity.toString()}",
                        ),
                        LikeButton(true),
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
            Material(
              color: Colors.transparent,
              child: InkWell(
                // Card ripple HACK
                onTap: () => tapCallback(context, movie),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;

  MovieDetailHeader(this.movie);

  @override
  Widget build(BuildContext context) {
    var moviePoster = ImageRepo.instance().buildImageUrl(movie.poster_path);

    return Row(
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
              List.of(movie.genre_list ?? []).map((i) => i.name).join("#"),
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
    );
  }
}

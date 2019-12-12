import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';
import 'package:tmdb/state/FavoriteMovieModel.dart';

import 'widgets.dart';

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;

  MovieDetailHeader(this.movie);

  @override
  Widget build(BuildContext context) {
    var moviePoster = ImageRepo.instance().buildImageUrl(movie.posterPath);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Hero(
            tag: "hero_${movie.id}",
            child: Card(
              child: CachedNetworkImage(
                imageUrl: moviePoster,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                style: TextStyle(fontSize: 25),
              ),
              Text(
                movie.releaseDate,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "\u{1F525} ${movie.popularity.toInt()}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                movie.adult ? "18+" : "3+",
                style: TextStyle(fontSize: 16),
              ),
              Consumer<FavoriteMovieModel>(
                builder: (context, likeModel, _) => LikeButton(
                    likeModel.isFavorite(movie.id),
                    () => _tapOnLikeButton(context)),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: List.of(movie.genreList ?? [])
                    .map((i) => Chip(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        label: Text(i.name)))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _tapOnLikeButton(BuildContext context) {
    Provider.of<FavoriteMovieModel>(context, listen: false)
        .toggleFavoriteMovie(movie.id);
  }
}

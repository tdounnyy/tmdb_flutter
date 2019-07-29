import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    var repo = ImageRepo.instance();
    var moviePoster = repo.buildImageUrl(movie.poster_path);
    print("image = $moviePoster");
    return CachedNetworkImage(imageUrl: moviePoster);
  }
}

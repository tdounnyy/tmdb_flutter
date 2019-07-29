import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Text(movie.title);
  }
}

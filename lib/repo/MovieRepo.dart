import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/util/C.dart';

class MovieRepo {
  static const POPULAR = "/movie/popular";
  static const MOVIE = "/movie/";

  Future<MovieResponse> popular() async {
    // TODO: bad smell
    var url = "${C.REMOTE_BASE_URL}$POPULAR?api_key=${C.API_KEY}&page=1";
    var future = await http.get(url);
    if (future.statusCode != 200) {
      return null;
    }
    return MovieResponse.fromJson(jsonDecode(future.body));
  }

  Future<MovieResponse> mockPopular() async {
    var jsonString = await rootBundle.loadString('assets/movie_page.json');
    return MovieResponse.fromJson(jsonDecode(jsonString));
  }

  Future<Movie> movieDetail(int movieId) async {
    var url = "${C.REMOTE_BASE_URL}$MOVIE$movieId?api_key=${C.API_KEY}";
    var future = await http.get(url);
    if (future.statusCode != 200) {
      return null;
    }
    return Movie.fromJson(jsonDecode(future.body));
  }

  Future<Movie> mockMovieDetail() async {
    var jsonString = await rootBundle.loadString('assets/movie_detail.json');
    Movie m = Movie.fromJson(jsonDecode(jsonString));
    return m;
  }

  Future<List<Cast>> movieCast(int movieId) async {
    var url = "${C.REMOTE_BASE_URL}$MOVIE$movieId/credits?api_key=${C.API_KEY}";
    var future = await http.get(url);
    if (future.statusCode != 200) {
      return null;
    }
    var json = jsonDecode(future.body);
    var result = List.of(json['cast']).map((i) => Cast.fromJson(i)).toList();
    result.sort((a, b) => a.order - b.order);
    return result;
  }

  MovieRepo._private();

  static final MovieRepo _instance = MovieRepo._private();

  factory MovieRepo.instance() => _instance;
}

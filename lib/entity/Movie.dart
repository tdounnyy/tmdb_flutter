import 'dart:convert';

import 'package:tmdb/entity/entities.dart';

class Movie {
  String poster_path;
  bool adult;
  num budget;
  String overview;
  String release_date;
  List<num> genre_ids;
  List<Genres> genre_list;
  num id;
  String original_title;
  String original_language;
  String title;
  String backdrop_path;
  num popularity;
  num vote_count;
  bool video;
  num vote_average;

  Movie();

  factory Movie.fromJson(Map<String, dynamic> json) {
    var movie = Movie()
      ..poster_path = json["poster_path"]
      ..adult = json["adult"]
      ..overview = json["overview"]
      ..release_date = json["release_date"]
      ..id = json["id"]
      ..budget = json["budget"]
      ..original_title = json["original_title"]
      ..original_language = json["original_language"]
      ..title = json["title"]
      ..backdrop_path = json["backdrop_path"]
      ..popularity = json["popularity"]
      ..vote_count = json["vote_count"]
      ..video = json["video"]
      ..vote_average = json["vote_average"]
      ..genre_ids = json["genre_ids"] != null
          ? List.of(json["genre_ids"]).map((i) => i as int).toList()
          : null
      ..genre_list = json["genres"] != null
          ? List.of(json["genres"])
              .map((i) => new Genres(id: i["id"], name: i["name"]))
              .toList()
          : null;
    return movie;
  }

  Map<String, dynamic> toJson() {
    return {
      "poster_path": this.poster_path,
      "adult": this.adult,
      "overview": this.overview,
      "release_date": this.release_date,
      "genre_ids": jsonEncode(this.genre_ids),
      "genres": jsonEncode(this.genre_list),
      "id": this.id,
      "budget": this.budget,
      "original_title": this.original_title,
      "original_language": this.original_language,
      "title": this.title,
      "backdrop_path": this.backdrop_path,
      "popularity": this.popularity,
      "vote_count": this.vote_count,
      "video": this.video,
      "vote_average": this.vote_average,
    };
  }
}

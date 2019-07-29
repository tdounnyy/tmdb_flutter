import 'dart:convert';

class Movie {
  String poster_path;
  bool adult;
  String overview;
  String release_date;
  List<int> genre_ids;
  int id;
  String original_title;
  String original_language;
  String title;
  String backdrop_path;
  int popularity;
  int vote_count;
  bool video;
  int vote_average;

  Movie();

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie()
      ..poster_path = json["poster_path"]
      ..adult = json["adult"].toLowerCase() == 'true'
      ..overview = json["overview"]
      ..release_date = json["release_date"]
      ..genre_ids = List.of(json["genre_ids"]).map((i) => int.parse(i)).toList()
      ..id = int.parse(json["id"])
      ..original_title = json["original_title"]
      ..original_language = json["original_language"]
      ..title = json["title"]
      ..backdrop_path = json["backdrop_path"]
      ..popularity = int.parse(json["popularity"])
      ..vote_count = int.parse(json["vote_count"])
      ..video = json["video"].toLowerCase() == 'true'
      ..vote_average = int.parse(json["vote_average"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "poster_path": this.poster_path,
      "adult": this.adult,
      "overview": this.overview,
      "release_date": this.release_date,
      "genre_ids": jsonEncode(this.genre_ids),
      "id": this.id,
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

import 'package:json_annotation/json_annotation.dart';
import 'package:tmdb/entity/entities.dart';

part 'Movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(required: true)
  num id;
  @JsonKey(name: 'poster_path')
  String posterPath;
  bool adult;
  num budget;
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'genre_ids')
  List<num> genreIds;
  @JsonKey(name: 'genre_list')
  List<Genres> genreList;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  String title;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  num popularity;
  @JsonKey(name: 'vote_count')
  num voteCount;
  bool video;
  @JsonKey(name: 'vote_average')
  num voteAverage;

  Movie(
    this.id, {
    this.posterPath,
    this.adult,
    this.budget,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.genreList,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

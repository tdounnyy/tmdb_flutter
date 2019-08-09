// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return Movie(
    json['id'] as num,
    posterPath: json['poster_path'] as String,
    adult: json['adult'] as bool,
    budget: json['budget'] as num,
    overview: json['overview'] as String,
    releaseDate: json['release_date'] as String,
    genreIds: (json['genre_ids'] as List)?.map((e) => e as num)?.toList(),
    genreList: (json['genre_list'] as List)
        ?.map((e) =>
            e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    originalTitle: json['original_title'] as String,
    originalLanguage: json['original_language'] as String,
    title: json['title'] as String,
    backdropPath: json['backdrop_path'] as String,
    popularity: json['popularity'] as num,
    voteCount: json['vote_count'] as num,
    video: json['video'] as bool,
    voteAverage: json['vote_average'] as num,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'budget': instance.budget,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genre_ids': instance.genreIds,
      'genre_list': instance.genreList,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return Person(
    id: json['id'] as int,
    name: json['name'] as String,
    profilePath: json['profile_path'] as String,
    adult: json['adult'] as bool,
    gender: json['gender'] as int,
    birthday: json['birthday'] as String,
    department: json['known_for_department'] as String,
    deathday: json['deathday'] as String,
    biography: json['biography'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    birthPlace: json['place_of_birth'] as String,
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'known_for_department': instance.department,
      'deathday': instance.deathday,
      'biography': instance.biography,
      'popularity': instance.popularity,
      'place_of_birth': instance.birthPlace,
    };

Cast _$CastFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id', 'cast_id']);
  return Cast(
    castId: json['cast_id'] as int,
    character: json['character'] as String,
    creditId: json['credit_id'] as String,
    order: json['order'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    profilePath: json['profile_path'] as String,
    adult: json['adult'] as bool,
    gender: json['gender'] as int,
    birthday: json['birthday'] as String,
    department: json['known_for_department'] as String,
    deathday: json['deathday'] as String,
    biography: json['biography'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    birthPlace: json['place_of_birth'] as String,
  );
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'known_for_department': instance.department,
      'deathday': instance.deathday,
      'biography': instance.biography,
      'popularity': instance.popularity,
      'place_of_birth': instance.birthPlace,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };

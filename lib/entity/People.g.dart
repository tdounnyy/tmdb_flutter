// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'People.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return People(
    id: json['id'] as int,
    name: json['name'] as String,
    profilePath: json['profile_path'] as String,
    adult: json['adult'] as bool,
    gender: json['gender'] as int,
  );
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'gender': instance.gender,
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
  );
}

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'gender': instance.gender,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };

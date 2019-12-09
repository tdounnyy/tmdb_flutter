import 'package:json_annotation/json_annotation.dart';

part 'Person.g.dart';

@JsonSerializable()
class Person {
  Person(
      {this.id,
      this.name,
      this.profilePath,
      this.adult,
      this.gender,
      this.birthday,
      this.department,
      this.deathday,
      this.biography,
      this.popularity,
      this.birthPlace});

  @JsonKey(required: true)
  int id;
  String name;
  @JsonKey(name: 'profile_path')
  String profilePath;
  bool adult;
  int gender;
  String birthday;
  @JsonKey(name: 'known_for_department')
  String department;
  String deathday;
  String biography;
  double popularity;
  @JsonKey(name: 'place_of_birth')
  String birthPlace;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class Cast extends Person {
  Cast({
    this.castId,
    this.character,
    this.creditId,
    this.order,
    // TODO: retyping is BAD
    int id,
    String name,
    @JsonKey(name: 'profile_path') String profilePath,
    bool adult,
    int gender,
    String birthday,
    @JsonKey(name: 'known_for_department') String department,
    String deathday,
    String biography,
    double popularity,
    @JsonKey(name: ' place_of_birth') String birthPlace,
  }) : super(
            id: id,
            name: name,
            profilePath: profilePath,
            adult: adult,
            gender: gender,
            birthday: birthday,
            department: department,
            deathday: deathday,
            biography: biography,
            popularity: popularity,
            birthPlace: birthPlace);

  @JsonKey(required: true, name: 'cast_id')
  int castId;
  String character;
  @JsonKey(name: 'credit_id')
  String creditId;
  int order;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'People.g.dart';

@JsonSerializable()
class People {
  People({this.id, this.name, this.profilePath, this.adult, this.gender});

  @JsonKey(required: true)
  int id;
  String name;
  @JsonKey(name: 'profile_path')
  String profilePath;
  bool adult;
  int gender;

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
}

@JsonSerializable()
class Cast extends People {
  Cast({
    this.castId,
    this.character,
    this.creditId,
    this.order,
    // TODO: retyping is BAD
    int id,
    String name,
    @JsonKey(name: 'profile_path')
    String profilePath,
    bool adult,
    int gender,
  }) : super(
            id: id,
            name: name,
            profilePath: profilePath,
            adult: adult,
            gender: gender);

  @JsonKey(required: true, name: 'cast_id')
  int castId;
  String character;
  @JsonKey(name: 'credit_id')
  String creditId;
  int order;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'Genres.g.dart';

@JsonSerializable()
class Genres {
  Genres({this.id, this.name});

  @JsonKey(required: true)
  int id;
  String name;

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

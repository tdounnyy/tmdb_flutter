class People {
  People({this.id, this.name, this.profile_path, this.adult, this.gender});

  int id;
  String name;
  String profile_path;
  bool adult;
  int gender;

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      id: json["id"],
      name: json["name"],
      gender: json["gender"],
      profile_path: json["profile_path"],
      adult: json["adult"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "gender": this.gender,
      "profile_path": this.profile_path,
      "adult": this.adult,
    };
  }
}

class Cast extends People {
  Cast({
    this.cast_id,
    this.character,
    this.credit_id,
    this.order,
    int id,
    String name,
    String profile_path,
    bool adult,
    int gender,
  }) : super(
            id: id,
            name: name,
            profile_path: profile_path,
            adult: adult,
            gender: gender);

  int cast_id;
  String character;
  String credit_id;
  int order;

  // TODO so many retyping for super class, got to be a way much elegant
  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      cast_id: json["cast_id"],
      character: json["character"],
      credit_id: json["credit_id"],
      order: json["order"],
      id: json["id"],
      name: json["name"],
      gender: json["gender"],
      profile_path: json["profile_path"],
      adult: json["adult"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cast_id": this.cast_id,
      "character": this.character,
      "credit_id": this.credit_id,
      "order": this.order,
      "id": this.id,
      "name": this.name,
      "gender": this.gender,
      "profile_path": this.profile_path,
      "adult": this.adult,
    };
  }
}

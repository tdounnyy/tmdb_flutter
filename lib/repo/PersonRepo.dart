import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/util/C.dart';

class PersonRepo {
  static const PERSON = "/person";

  Future<Person> personById(int personId) async {
    var url = "${C.REMOTE_BASE_URL}$PERSON/$personId?api_key=${C.API_KEY}";
    var future = await http.get(url);
    if (future.statusCode != 200) {
      return null;
    }
    return Person.fromJson(jsonDecode(future.body));
  }

  static final PersonRepo _instance = PersonRepo._private();

  PersonRepo._private();

  factory PersonRepo.instance() => _instance;
}

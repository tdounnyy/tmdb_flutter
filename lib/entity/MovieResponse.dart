import 'dart:convert';

import 'package:tmdb/entity/entities.dart';

class MovieResponse {
  num page;
  List<Movie> results;
  num total_results;
  num total_pages;

  MovieResponse();

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse()
      ..page = json["page"]
      ..results =
          List.of(json["results"]).map((i) => Movie.fromJson(i)).toList()
      ..total_results = json["total_results"]
      ..total_pages = json["total_pages"];
  }

  Map<String, dynamic> toJson() {
    return {
      "page": this.page,
      "results": jsonEncode(this.results),
      "total_results": this.total_results,
      "total_pages": this.total_pages,
    };
  }
}

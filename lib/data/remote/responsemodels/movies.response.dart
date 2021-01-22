import 'package:json_annotation/json_annotation.dart';
import 'package:search_movie_app/data/model/movie.dart';

part 'movies.response.g.dart';

@JsonSerializable()
class MoviesResponse {
  List<Movie> Search;

  MoviesResponse({ this.Search });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
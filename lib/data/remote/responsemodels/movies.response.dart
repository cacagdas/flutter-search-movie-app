import 'package:json_annotation/json_annotation.dart';
import 'package:search_movie_app/data/model/movie.dart';

part 'movies.response.g.dart';

@JsonSerializable()
class MoviesResponse {
  String message;
  List<Movie> data;
  String errorCode;

  MoviesResponse({ this.message, this.data, this.errorCode });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

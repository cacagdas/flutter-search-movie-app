import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Movie with ChangeNotifier{
  String title;
  String poster;
  bool isFavorite;

  Movie({this.title, this.poster, this.isFavorite = false});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["Title"],
        poster: json["Poster"]
    );
  }

  void setFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

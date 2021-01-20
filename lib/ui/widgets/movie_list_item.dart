import 'package:search_movie_app/data/model/movie.dart';
import 'package:flutter/material.dart';

class MovieListItem extends StatefulWidget {
  const MovieListItem({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  _MovieListItemState createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

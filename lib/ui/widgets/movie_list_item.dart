import 'package:search_movie_app/data/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:search_movie_app/values/colors.dart' as colors;
import 'package:provider/provider.dart';
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
    final movie = Provider.of<Movie>(context, listen: false);
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: FadeInImage(
          placeholder: AssetImage('asset/images/movie-placeholder.png'),
          image: NetworkImage(widget.movie.poster),
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Movie>(
            builder: (context, movie, child) => IconButton(
              icon: Icon(
                  movie.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                movie.setFavorite();
              },
            ),
          ),
          title: Text(
            widget.movie.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
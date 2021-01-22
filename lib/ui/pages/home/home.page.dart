import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_movie_app/data/model/movie.dart';
import 'package:search_movie_app/data/remote/remote_service.dart';
import 'package:search_movie_app/di/injector_provider.dart';
import 'package:search_movie_app/ui/widgets/app_bar.dart';
import 'package:search_movie_app/ui/widgets/movie_list_item.dart';
import 'package:search_movie_app/values/colors.dart' as colors;

class HomePage extends StatefulWidget {

  final String query;
  HomePage({this.query});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RemoteService _remoteService = inject<RemoteService>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _isLoading = false;
  List<Movie> movies;

  @override
  void initState() {
    super.initState();
    _sendGetMoviesRequest();
  }

  void _sendGetMoviesRequest() async {
    setState(() { _isLoading = true; });

    await _remoteService.getMovies('1e8bf6a5', widget.query).catchError((error) {
      if ((error as DioError).type != DioErrorType.CANCEL &&
          !(error as DioError).message.contains("SocketException")) {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('Please try again later.'),
                ));
      }
    }).then((value) {
      movies = value.Search;
    });
    setState(() { _isLoading = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(),
        body: Container(
          width: double.infinity,
          color: Theme.of(context).primaryColorLight,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: (movies == null)
                ? CircularProgressIndicator()
                : movies.isEmpty
                    ? LayoutBuilder(
                        builder: (ctx, constraints) {
                          return Column(
                            children: <Widget>[
                              Text(
                                'No results!',
                                style: Theme.of(context).textTheme.title,
                              ),
                            ],
                          );
                        },
                      )
                    : Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: GridView.count(
                              crossAxisCount: 2,
                              children: movies
                                  .map((mov) => MovieListItem(
                                        key: ValueKey(
                                            movies.indexOf(mov).toString()),
                                        movie: mov,
                                      ))
                                  .toList()),
                        ),
                        Visibility(
                          visible: _isLoading,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ]),
          ),
        ));
  }
}

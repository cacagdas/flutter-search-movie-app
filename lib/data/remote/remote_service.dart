import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:search_movie_app/data/remote/responsemodels/movies.response.dart';

import 'constants/endpoints.dart';

part 'remote_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class RemoteService {
  factory RemoteService(Dio dio, {String baseUrl}) = _RemoteService;

  @GET(Endpoints.getMovies)
  Future<MoviesResponse> getMovies(
      @Query("apikey") String apiKey,
      @Query("s") String query,
      );

}

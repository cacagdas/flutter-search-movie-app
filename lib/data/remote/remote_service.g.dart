// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RemoteService implements RemoteService {
  _RemoteService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://www.omdbapi.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<MoviesResponse> getMovies(apiKey, query) async {
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'apikey': apiKey, r't': query};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MoviesResponse.fromJson(_result.data);
    return value;
  }
}

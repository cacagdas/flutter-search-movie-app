// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RemoteService implements RemoteService {
  _RemoteService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<MoviesResponse> getMovies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
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

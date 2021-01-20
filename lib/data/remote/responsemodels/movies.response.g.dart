// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) {
  return MoviesResponse(
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errorCode: json['errorCode'] as String,
  );
}

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'errorCode': instance.errorCode,
    };

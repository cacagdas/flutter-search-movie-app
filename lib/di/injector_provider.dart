import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:search_movie_app/data/remote/remote_service.dart';
import 'package:search_movie_app/util/device/connection/connection.helper.dart';

final GetIt inject = GetIt.instance;
final dio = Dio();

Future<void> setupInjection() async {

  //Remote Service
  Interceptor _interceptor() {
    return InterceptorsWrapper(onRequest: (RequestOptions request) async {
      return request;
    }, onError: (DioError error) async {
      if (error.message.contains("SocketException")) {
        bool _isConnected;
        await ConnectionHelper.hasConnection()
            .then((value) => _isConnected = value)
            .catchError((_) {
          _isConnected = true;
        });
        if (!_isConnected) {
          Fluttertoast.cancel();
          Fluttertoast.showToast(
              msg: 'Please check your network connection.',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white);
          error.type = DioErrorType.CANCEL;
          return error;
        } else
          return error;
      } else if (error.response.statusCode == 500)
        return error.response;
      else
        return error;
    });
  }

  dio.interceptors.add(_interceptor());
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  inject.registerSingleton(RemoteService(dio));
}

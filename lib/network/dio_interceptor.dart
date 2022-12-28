import 'dart:io';

import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  // RequestRetrier requestRetrier;
  // DioInterceptor({required this.requestRetrier});
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      handler.resolve(Response(requestOptions: err.requestOptions, data: []));
    } else {
      handler.resolve(Response(requestOptions: err.requestOptions, data: []));
    }
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}

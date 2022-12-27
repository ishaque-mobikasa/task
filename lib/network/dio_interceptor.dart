import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:task/network/request_retrier.dart';

class DioInterceptor extends Interceptor {
  RequestRetrier requestRetrier;
  DioInterceptor({required this.requestRetrier});
  @override
  Future<Response> onError(
      DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      log("Erro handler is intercepting now");
      final response =
          await requestRetrier.schedulerRequestRetry(err.requestOptions);
      handler.resolve(response);
    }
    

    return Response(requestOptions: err.requestOptions, data: []);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}

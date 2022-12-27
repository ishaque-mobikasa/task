import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/network/dio_interceptor.dart';
import 'package:task/network/request_retrier.dart';

class DioService {
  static Dio dio =
      Dio(BaseOptions(baseUrl: CustomStrings.backendUrl, receiveTimeout: 20000))
        ..interceptors.add(DioInterceptor(
            requestRetrier:
                RequestRetrier(connectivity: Connectivity(), dio: Dio())));
  static Future<dynamic> postMethod(
      {required String url, required value}) async {
    return await dio.post(url, data: value).then((value) => value);
  }

  static Future<dynamic> getMethod({required String url}) async {
    return await dio.get(url).then((value) => value);
  }
}

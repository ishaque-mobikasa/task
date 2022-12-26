import 'package:dio/dio.dart';
import 'package:task/app/utils/custom_strings.dart';

abstract class NetworkManager {}

class DioService implements NetworkManager {
  static var dio = Dio(BaseOptions(baseUrl: CustomStrings.backendUrl));
  static Future<dynamic> postMethod(
      {required String url, required value}) async {
    return await dio.post(url, data: value).then((value) => value);
  }

  static Future<dynamic> getMethod({required String url}) async {
    return await dio.get(url).then((value) => value);
  }
}

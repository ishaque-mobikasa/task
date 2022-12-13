import 'package:dio/dio.dart';
import 'package:task/data/repositories/data_repositories.dart';

class DioService {
  static final dio = Dio(BaseOptions(baseUrl: MyApiUrl.backendUrl));
  static Future<dynamic> postMethod(
      {required String url, required value}) async {
    return await dio.post(url, data: value).then((value) => value);
  }
  static Future<dynamic> getMethod(
      {required String url}) async {
    return await dio.get(url).then((value) => value);
  }
}
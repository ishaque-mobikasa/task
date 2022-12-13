import 'package:dio/dio.dart';
import 'package:task/data/data_sources/dio_services.dart';
import 'package:task/data/models/onBoard/products/product_model.dart';
import 'package:task/data/repositories/data_repositories.dart';

enum CategoryType { jewelery, electronics, mensClothing, womensClothing }

class NetworkRequester {
  static Future<List<ProductsModel>> fetchAllProducts() async {
    Response response = await DioService.getMethod(url: MyApiUrl.allProducts);
    if (response.statusCode == 200) {
      return productsModelFromJson(response.data);
    }
    return [];
  }

  static Future<List<ProductsModel>> fetchAllProductsCategoryWise(
      CategoryType categoryType) async {
    Response response;
    switch (categoryType) {
      case CategoryType.jewelery:
        response = await DioService.getMethod(url: MyApiUrl.jewelery);
        break;
      case CategoryType.electronics:
        response = await DioService.getMethod(url: MyApiUrl.electronics);
        break;
      case CategoryType.mensClothing:
        response = await DioService.getMethod(url: MyApiUrl.mensClothing);
        break;
      case CategoryType.womensClothing:
        response = await DioService.getMethod(url: MyApiUrl.mensClothing);
    }
    if (response.statusCode == 200) {
      return productsModelFromJson(response.data);
    }
   else {
      return [];
    }
  }
}

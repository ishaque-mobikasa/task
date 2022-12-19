import 'package:dio/dio.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/data/models/products/product_model.dart';
import 'package:task/network/dio_services.dart';

enum CategoryType { jewelery, electronics, mensClothing, womensClothing }

class HomeRepository {
  static Future<List<ProductsModel>> fetchAllProducts() async {
    Response response =
        await DioService.getMethod(url: CustomStrings.allProductsUrl);
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
        response = await DioService.getMethod(url: CustomStrings.jewelery);
        break;
      case CategoryType.electronics:
        response = await DioService.getMethod(url: CustomStrings.electronics);
        break;
      case CategoryType.mensClothing:
        response = await DioService.getMethod(url: CustomStrings.mensClothing);
        break;
      case CategoryType.womensClothing:
        response = await DioService.getMethod(url: CustomStrings.mensClothing);
    }
    if (response.statusCode == 200) {
      return productsModelFromJson(response.data);
    } else {
      return [];
    }
  }
}

import 'dart:developer';

import 'package:get/get.dart';
import 'package:task/data/data_sources/all_products_request.dart';
import 'package:task/data/models/onBoard/products/product_model.dart';

class HomeController extends GetxController {
  RxList<ProductsModel> productsList = <ProductsModel>[].obs;
  RxInt currentIndex = 0.obs;
  void indexChanger(int newIndex) {
    if (currentIndex.value != newIndex) {
      currentIndex.value = newIndex;
    }
    currentIndex.value = newIndex;
  }

  void fetchAllitems() async {
    final List<ProductsModel> networkResponse =
        await NetworkRequester.fetchAllProductsCategoryWise(
            CategoryType.mensClothing);
    for (var element in networkResponse) {
      log(element.category.toString());
    }
  }
}

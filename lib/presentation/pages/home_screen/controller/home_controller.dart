import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/data/data_sources/all_products_request.dart';
import 'package:task/data/models/onBoard/products/product_model.dart';

class HomeController extends GetxController {
  RxList<ProductsModel> productsList = <ProductsModel>[].obs;
  RxBool isLoading = true.obs;
  RxInt dotsIndex = 0.obs;
  Rx<PageController> dotsController = PageController().obs;
  @override
  void onInit() {
    fetchAllitems();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    dotsChanger(dotsIndex.value);
  }

  void fetchAllitems() async {
    try {
      isLoading.value = true;
      productsList.value = await NetworkRequester.fetchAllProducts();
      productsList.shuffle();
    } finally {
      isLoading.value = false;
    }
  }

  dotsChanger(int index) {
    dotsIndex.value = index;
    Timer(
        const Duration(seconds: 2),
        () => {
              dotsController.value.nextPage(
                  duration: const Duration(seconds: 2), curve: Curves.easeIn)
            });
  }
}

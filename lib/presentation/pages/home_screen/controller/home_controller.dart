import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/data/models/products/product_model.dart';

import 'package:task/domain/repositories/home_repo/home_repository.dart';

class HomeController extends GetxController {
  RxList<ProductsModel> productsList = <ProductsModel>[].obs;

  RxBool isLoading = true.obs;
  RxInt dotsIndex = 0.obs;
  Rx<PageController> dotsController = PageController().obs;
  @override
  void onInit() {
    fetchAllitems();
    dotsChanger(dotsIndex.value);
    super.onInit();
  }

  void fetchAllitems() async {
    try {
      isLoading.value = true;
      productsList.value = await HomeRepository.fetchAllProducts();
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

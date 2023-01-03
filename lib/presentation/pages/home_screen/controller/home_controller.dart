import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/data/models/products/product_model.dart';
import 'package:task/domain/repositories/home_repo/home_repository.dart';
import 'package:task/presentation/pages/home_screen/widgets/custom_alert.dart';

class HomeController extends GetxController {
  RxList<ProductsModel> productsList = <ProductsModel>[].obs;
  RxBool isLoading = true.obs;
  RxInt dotsIndex = 0.obs;

  @override
  void onInit() {
    fetchAllitems();
    super.onInit();
    dotsChanger(0);
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

  dotsChanger(int index) async {
    dotsIndex.value = index;
  }
}

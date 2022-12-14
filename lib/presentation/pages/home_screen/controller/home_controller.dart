import 'package:get/get.dart';
import 'package:task/data/data_sources/all_products_request.dart';
import 'package:task/data/models/onBoard/products/product_model.dart';

class HomeController extends GetxController {
  RxList<ProductsModel> productsList = <ProductsModel>[].obs;
  RxInt currentIndex = 0.obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    fetchAllitems();
    super.onInit();
  }

  void indexChanger(int newIndex) {
    if (currentIndex.value != newIndex) {
      currentIndex.value = newIndex;
    }
    currentIndex.value = newIndex;
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
}

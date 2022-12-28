import 'package:get/get.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/data/models/products/product_model.dart';
import 'package:task/domain/repositories/category_repo/category_repo.dart';
import 'package:task/domain/repositories/home_repo/home_repository.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    categoryListPopulator();
    super.onInit();
  }

  RxBool isLoading = true.obs;
  RxList<String> categoryNameList = <String>[].obs;

 
  // HomeController homeController = Get.find<HomeController>();
  // RxList<ProductsModel> electronics = <ProductsModel>[].obs;
  // RxList<ProductsModel> jewelery = <ProductsModel>[].obs;
  // RxList<ProductsModel> mensClothing = <ProductsModel>[].obs;
  // RxList<ProductsModel> womensClothing = <ProductsModel>[].obs;

  // productListCategoriser() {
  //   if (homeController.productsList.isNotEmpty) {
  //     electronics
  //       ..clear()
  //       ..addAll(homeController.productsList
  //           .where((product) => product.category == CustomStrings.electronics)
  //           .toList());
  //     jewelery
  //       ..clear()
  //       ..addAll(homeController.productsList
  //           .where((product) => product.category == CustomStrings.jewelery)
  //           .toList());
  //     mensClothing
  //       ..clear()
  //       ..addAll(homeController.productsList
  //           .where((product) => product.category == CustomStrings.mensClothing)
  //           .toList());
  //     womensClothing
  //       ..clear()
  //       ..addAll(homeController.productsList
  //           .where(
  //               (product) => product.category == CustomStrings.womensClothing)
  //           .toList());
  //   } else {
  //     return;
  //   }
  // }

  categoryListPopulator() async {
    try {
      isLoading.value = true;
      List<String> categoryData =
          await CategoryRepository.fetchAllCategoryHeads();
      categoryNameList
        ..clear()
        ..addAll(categoryData);
    } finally {
      isLoading.value = false;
    }
  }

  
}

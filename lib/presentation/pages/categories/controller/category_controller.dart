import 'package:get/get.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/data/models/products/product_model.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    homeController = Get.put(HomeController());
    super.onInit();
  }

  List<String> categoryList = [
    CustomStrings.electronics,
    CustomStrings.jewelery,
    CustomStrings.mensClothing,
    CustomStrings.womensClothing,
  ];

  HomeController homeController = Get.find<HomeController>();
  RxList<ProductsModel> electronics = <ProductsModel>[].obs;
  RxList<ProductsModel> jewelery = <ProductsModel>[].obs;
  RxList<ProductsModel> mensClothing = <ProductsModel>[].obs;
  RxList<ProductsModel> womensClothing = <ProductsModel>[].obs;

  productListCategoriser() {
    if (homeController.productsList.isNotEmpty) {
      electronics
        ..clear()
        ..addAll(homeController.productsList
            .where((product) => product.category == CustomStrings.electronics)
            .toList());
      jewelery
        ..clear()
        ..addAll(homeController.productsList
            .where((product) => product.category == CustomStrings.jewelery)
            .toList());
      mensClothing
        ..clear()
        ..addAll(homeController.productsList
            .where((product) => product.category == CustomStrings.mensClothing)
            .toList());
      womensClothing
        ..clear()
        ..addAll(homeController.productsList
            .where(
                (product) => product.category == CustomStrings.womensClothing)
            .toList());
    } else {
      return;
    }
  }
}

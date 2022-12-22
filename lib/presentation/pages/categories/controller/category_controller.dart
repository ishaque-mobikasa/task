import 'package:get/get.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/data/models/products/product_model.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    productListCategoriser();
    super.onInit();
  }

  List<String> categoryList = [
    CustomStrings.electronics,
    CustomStrings.jewelery,
    CustomStrings.mensClothing,
    CustomStrings.womensClothing,
  ];

  HomeController homeController = Get.put(HomeController());
  RxList<ProductsModel> electronics = <ProductsModel>[].obs;
  RxList<ProductsModel> jewelery = <ProductsModel>[].obs;
  RxList<ProductsModel> mensClothing = <ProductsModel>[].obs;
  RxList<ProductsModel> womensClothing = <ProductsModel>[].obs;

  productListCategoriser() {
    if (homeController.productsList.isNotEmpty) {
      for (var element in homeController.productsList) {
        if (element.category == CustomStrings.electronics) {
          electronics.add(element);
        } else if (element.category == CustomStrings.jewelery) {
          jewelery.add(element);
        } else if (element.category == CustomStrings.mensClothing) {
          mensClothing.add(element);
        } else {
          womensClothing.add(element);
        }
      }
    } else {
      return;
    }
  }
}

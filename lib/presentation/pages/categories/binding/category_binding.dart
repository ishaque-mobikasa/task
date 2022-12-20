import 'package:get/get.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}

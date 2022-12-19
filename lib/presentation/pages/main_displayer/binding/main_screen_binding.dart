import 'package:get/get.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';
import 'package:task/presentation/pages/main_displayer/controller/main_displayer_controller.dart';

class MainDisplayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<MainDisplayerController>(MainDisplayerController());
  }
}

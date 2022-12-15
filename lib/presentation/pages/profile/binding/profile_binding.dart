import 'package:get/get.dart';
import 'package:task/presentation/pages/profile/controller/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}

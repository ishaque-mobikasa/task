import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/core/routes.dart';
import 'package:task/data/models/onBoard/user/user_model.dart';

class ProfileController extends GetxController {
  late SharedPreferences preferences;
  Rx<UserModel> userData = UserModel(
          phoneNumber: "phoneNumber",
          password: "password",
          email: "email",
          city: "city",
          state: "state")
      .obs;
  @override
  void onInit() async {
    preferences = await SharedPreferences.getInstance();
    final data = preferences.getString(SharedPrefString.loggedInUserkey);
    userData.value = UserModel.fromJson(
        jsonDecode(preferences.getString(data.toString()).toString()));
    super.onInit();
  }

  onLogoutButtonClick() {
    preferences.setBool(SharedPrefString.isLoggedIn, false);
    Get.offNamedUntil(Routes.loginScreen, (route) => false);
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/preferences.dart';
import 'package:task/data/models/onBoard/user/user_model.dart';

class LoginController extends GetxController {
  @override
  void onInit() async {
    preferences = await SharedPreferences.getInstance();
    super.onInit();
  }

  late SharedPreferences preferences;
  final loginKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final RxBool isObscured = true.obs;
  final RxBool isEnabled = false.obs;
  onLoginButtonPress() {
    if (loginKey.value.currentState!.validate()) {
      String? dataOndisk = preferences.getString(emailController.value.text);

      if (dataOndisk != null) {
        UserModel user = UserModel.fromJson(jsonDecode(dataOndisk));
        if (user.email == emailController.value.text &&
            user.password == passwordController.value.text) {
          preferences.setBool(isLoggedIn, true);
          Get.snackbar("Valid Credentials", "You are being Logged in");
        } else {
          Get.snackbar("Invalid Credentials", "Try  again");
          return;
        }
      } else {
        Get.snackbar("You are not registered..", "Try Registering with Us");
        return;
      }
    }
  }

  togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }

  toggleLoginButton() {
    if (loginKey.value.currentState!.validate()) {
      isEnabled.value = true;
    } else {
      isEnabled.value = false;
    }
  }
}

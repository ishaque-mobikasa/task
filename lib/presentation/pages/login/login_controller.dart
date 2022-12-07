import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final RxBool isObscured = true.obs;
  final RxBool isEnabled = false.obs;
  onLoginButtonPress() {
    loginKey.value.currentState?.validate();
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

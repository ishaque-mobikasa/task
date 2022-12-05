import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final  loginKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;

      onLoginButtonPress(){
        loginKey.value.currentState?.validate();
      }
}

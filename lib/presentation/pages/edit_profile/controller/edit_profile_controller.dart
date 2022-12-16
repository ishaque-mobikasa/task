// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/data/models/onBoard/user/user_model.dart';
import 'package:task/presentation/pages/profile/controller/profile_controller.dart';

class EditProfileController extends GetxController {
  late SharedPreferences preferences;
  Rx<UserModel> model = UserModel(
          phoneNumber: "phoneNumber",
          password: "password",
          email: "email",
          city: "city",
          state: "state")
      .obs;
  final editKey = GlobalKey<FormState>().obs;
  RxBool isEnabled = false.obs;
  final RxBool isObscured = true.obs;
  ProfileController profileController = Get.put(ProfileController());
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;

  @override
  void onInit() async {
    preferences = await SharedPreferences.getInstance();
    final data = preferences.getString(SharedPrefString.loggedInUserkey);
    model.value = UserModel.fromJson(
        jsonDecode(preferences.getString(data.toString()).toString()));
    stateController.value = TextEditingController(text: model.value.state);
    cityController.value = TextEditingController(text: model.value.city);
    super.onInit();
  }

  toggleUpdateButton() {
    if (editKey.value.currentState!.validate()) {
      isEnabled.value = true;
    } else {
      isEnabled.value = false;
    }
  }

  onUpdateButtonPressed() {
    if (editKey.value.currentState!.validate()) {
      UserModel newModel = UserModel(
          email: model.value.email,
          city: cityController.value.text,
          state: stateController.value.text,
          phoneNumber: model.value.phoneNumber,
          password: model.value.password);
      preferences.setString(model.value.email, jsonEncode(newModel.toJson()));
      profileController.userData.value = newModel;
      Get.back();
    } else {
      return null;
    }
  }
}

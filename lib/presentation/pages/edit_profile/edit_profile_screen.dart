import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/utils/app_colors.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/presentation/pages/edit_profile/controller/edit_profile_controller.dart';
import 'package:task/presentation/pages/login/widgets/custom_form_field.dart';
import 'package:task/presentation/widgets/custom_login_button.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(controller.model.value.email),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(20),
                    color: CustomColors.themeColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          maxRadius: 60,
                          backgroundImage:
                              AssetImage("assets/images/profile_dummy.jpg"),
                        ),
                        SizedBox(
                          width: 200,
                          child: Card(
                            child: Column(
                              children: [
                                Text(
                                  controller.model.value.email,
                                  style: CustomStyle.style,
                                ),
                                Text(
                                  controller.model.value.phoneNumber,
                                  style: CustomStyle.style,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Form(
                key: controller.editKey.value,
                onChanged: () => {controller.toggleUpdateButton()},
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() => CustomFormField(
                          controller: controller.stateController.value,
                          icon: Icons.flag,
                          type: FieldType.normalInputField,
                          hintText: "State",
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                        )),
                    Obx(() => CustomFormField(
                          controller: controller.cityController.value,
                          icon: Icons.location_city,
                          type: FieldType.normalInputField,
                          hintText: "City",
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        )),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Obx((() => CustomLoginSignUpButton(
                                buttonName: "Update",
                                isEnabled: controller.isEnabled.value,
                                onButtonClick: () =>
                                    {
                                    controller.onUpdateButtonPressed()
                                  
                                    }))),
                          ),
                        )),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/manager/login/login_controller.dart';
import 'package:task/presentation/pages/login/widgets/custom_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: controller.loginKey.value,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/login.jpg"),
                        fit: BoxFit.cover)),
                height: size.height * 0.4,
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFormField(
                    type: FieldType.eMail,
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomFormField(
                    hintText: "Password",
                    type: FieldType.password,
                    icon: Icons.password,
                    controller: controller.passwordController.value,
                  )),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side:
                                        const BorderSide(color: Colors.black))),
                            onPressed: () {
                              controller.onLoginButtonPress();
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      )),
    );
  }
}

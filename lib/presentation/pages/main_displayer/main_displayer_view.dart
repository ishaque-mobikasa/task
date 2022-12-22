import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/pages/main_displayer/controller/main_displayer_controller.dart';

class MainDisplayerView extends GetView<MainDisplayerController> {
  const MainDisplayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(() => NavigationBar(
                onDestinationSelected: (value) => controller.setIndex(value),
                selectedIndex: controller.selectedIndex.value,
                height: 60,
                backgroundColor: Colors.white,
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                  NavigationDestination(
                      icon: Icon(Icons.category), label: "Categories"),
                  NavigationDestination(
                      icon: Icon(Icons.person), label: "Profile"),
                ])),
        body: Obx(() => controller.currentWidget),
      ),
    );
  }
}

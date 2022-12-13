import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Obx(() => NavigationBar(
                  onDestinationSelected: (value) =>
                      controller.indexChanger(value),
                  selectedIndex: controller.currentIndex.value,
                  height: 60,
                  backgroundColor: Colors.white,
                  destinations: const [
                    NavigationDestination(
                        icon: Icon(Icons.home), label: "Home"),
                    NavigationDestination(
                        icon: Icon(Icons.category), label: "Categories"),
                    NavigationDestination(
                        icon: Icon(Icons.person), label: "Profile"),
                  ])),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                centerTitle: true,
                title: const Text("D A S H B O A R D"),
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.fetchAllitems();
                      },
                      icon: const Icon(Icons.search))
                ],
              )
            ],
            body: ListView(children: [Container()]),
          )),
    );
  }
}

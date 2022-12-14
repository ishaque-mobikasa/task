import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/utils/dimensions.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/core/preferences_const_strings.dart.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';
import 'package:task/presentation/pages/home_screen/widgets/test_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
            body: Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: CustomDimensions.padding20,
                                horizontal: 30),
                            child: Text(
                              "Browse What we have in offer..",
                              textAlign: TextAlign.start,
                              style: CustomStyle.style,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: controller.productsList
                              .map(
                                  (element) => ProductTileSmall(model: element))
                              .take(7)
                              .toList(),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: CustomDimensions.padding20,
                            horizontal: 30),
                        child: Text(
                          "Your aesthetics have something here in..",
                          textAlign: TextAlign.start,
                          style: CustomStyle.style,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: controller.productsList
                                .where((element) =>
                                    element.category ==
                                    CategoryStrings.jewelery)
                                .map((data) => ProductTileSmall(model: data))
                                .toList()),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: CustomDimensions.padding20,
                            horizontal: 30),
                        child: Text(
                          "Have a look on our gadget collections..",
                          textAlign: TextAlign.start,
                          style: CustomStyle.style,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: controller.productsList
                                .where((element) =>
                                    element.category ==
                                    CategoryStrings.electronics)
                                .map((data) => ProductTileSmall(model: data))
                                .toList()),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: CustomDimensions.padding20,
                            horizontal: 30),
                        child: Text(
                          "Clothing ideas for Her..",
                          textAlign: TextAlign.start,
                          style: CustomStyle.style,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: controller.productsList
                                .where((element) =>
                                    element.category ==
                                    CategoryStrings.womensClothing)
                                .map((data) => ProductTileSmall(model: data))
                                .toList()),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: CustomDimensions.padding20,
                            horizontal: 30),
                        child: Text(
                          "Unleash your Masculinity...",
                          textAlign: TextAlign.start,
                          style: CustomStyle.style,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.25,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: controller.productsList
                                .where((element) =>
                                    element.category ==
                                    CategoryStrings.mensClothing)
                                .map((data) => ProductTileSmall(model: data))
                                .toList()),
                      ),
                    ],
                  )),
          )),
    );
  }
}

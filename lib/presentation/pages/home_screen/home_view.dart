import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/app/utils/dimensions.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/core/routes.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';
import 'package:task/presentation/pages/home_screen/widgets/product_tile.dart';
import 'package:task/presentation/pages/on_boarding/widget/build_dots.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          floating: true,
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
                SizedBox(
                  height: 200,
                  child: PageView(
                      controller: controller.dotsController.value,
                      onPageChanged: (index) {
                        controller.dotsChanger(index);
                        if (index == 5) {
                          controller.dotsController.value.jumpToPage(0);
                        }
                      },
                      children: controller.productsList
                          .take(6)
                          .map(
                            (element) => Card(
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Center(
                                    child: Image.network(
                                      element.image.toString(),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        return loadingProgress == null
                                            ? child
                                            : SizedBox(
                                                height: size.width * 0.2,
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                )));
                                      },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: BuildDots(
                    currentIndex: controller.dotsIndex.value,
                    dotsCount: 5,
                    dotsColor: const Color.fromARGB(255, 39, 132, 3),
                  ),
                ),
                Row(
                  children: [headingText("Browse What we have in offer..")],
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: controller.productsList
                        .map((element) => ProductTileSmall(
                              model: element,
                              onTap: () => Get.toNamed(Routes.productDetails,
                                  arguments: element),
                            ))
                        .take(7)
                        .toList(),
                  ),
                ),
                headingText("Your aesthetics have something here in.."),
                SizedBox(
                  height: size.height * 0.25,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: controller.productsList
                          .where((element) =>
                              element.category == CategoryStrings.jewelery)
                          .map((data) => ProductTileSmall(
                                model: data,
                                onTap: () => Get.toNamed(Routes.productDetails,
                                    arguments: data),
                              ))
                          .toList()),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: CustomDimensions.padding20, horizontal: 30),
                  child: Text(
                    "What we have in offer on electronics",
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
                              element.category == CategoryStrings.electronics)
                          .map((data) => ProductTileSmall(
                                model: data,
                                onTap: () => Get.toNamed(Routes.productDetails,
                                    arguments: data),
                              ))
                          .toList()),
                ),
                headingText("Clothing ideas for Her.."),
                SizedBox(
                  height: size.height * 0.25,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: controller.productsList
                          .where((element) =>
                              element.category ==
                              CategoryStrings.womensClothing)
                          .map((data) => ProductTileSmall(
                                model: data,
                                onTap: () => Get.toNamed(Routes.productDetails,
                                    arguments: data),
                              ))
                          .toList()),
                ),
                headingText("Unleash your Masculinity..."),
                SizedBox(
                  height: size.height * 0.25,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: controller.productsList
                          .where((element) =>
                              element.category == CategoryStrings.mensClothing)
                          .map((data) => ProductTileSmall(
                                model: data,
                                onTap: () => Get.toNamed(Routes.productDetails,
                                    arguments: data),
                              ))
                          .toList()),
                ),
              ],
            )),
    );
  }

  Padding headingText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: CustomDimensions.padding20, horizontal: 30),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: CustomStyle.style,
      ),
    );
  }
}

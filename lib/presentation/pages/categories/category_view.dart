import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/core/routes.dart';
import 'package:task/presentation/pages/categories/controller/category_controller.dart';
import 'package:task/presentation/pages/home_screen/controller/home_controller.dart';

import 'widgets/category_card.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.put(HomeController());
    return controller.homeController.productsList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "oops!!..Some thing went wrong",
                    style: CustomStyle.style,
                  ),
                ],
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.5,
                child: Center(
                  child: (GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Obx(() => CategoryCard(
                              onTap: () => Get.toNamed(
                                  Routes.categoryListingScreen,
                                  arguments: controller.categoryList[index]),
                              productsModel: index == 0
                                  ? controller.electronics.last
                                  : index == 1
                                      ? controller.jewelery.last
                                      : index == 2
                                          ? controller.mensClothing.last
                                          : controller.womensClothing.first,
                              bottomText:
                                  controller.categoryList[index].toUpperCase(),
                            ));
                      })),
                ),
              ),
            ],
          );
  }
}

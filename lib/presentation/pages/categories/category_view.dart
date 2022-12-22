import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/routes.dart';
import 'package:task/presentation/pages/categories/controller/category_controller.dart';

import 'widgets/category_card.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.5,
          child: Center(
            child: (GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    onTap: () => Get.toNamed(Routes.categoryListingScreen,
                        arguments: controller.categoryList[index]),
                    topText: controller.categoryList[index].toUpperCase(),
                    bottomText: "",
                  );
                })),
          ),
        ),
      ],
    );
  }
}

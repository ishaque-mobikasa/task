import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/utils/custom_strings.dart';
import 'package:task/presentation/pages/categories/controller/category_controller.dart';

import 'widgets/rectangular_category_card.dart';

class CategoryListingView extends GetView<CategoryController> {
  const CategoryListingView({super.key});

  @override
  Widget build(BuildContext context) {
    var itemType = Get.arguments;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(itemType.toUpperCase()),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: itemType == CustomStrings.electronics
              ? controller.electronics.length
              : itemType == CustomStrings.jewelery
                  ? controller.jewelery.length
                  : itemType == CustomStrings.mensClothing
                      ? controller.mensClothing.length
                      : controller.womensClothing.length,
          itemBuilder: (context, index) {
            return RectangularCard(
              product: itemType == CustomStrings.jewelery
                  ? controller.jewelery[index]
                  : itemType == CustomStrings.electronics
                      ? controller.electronics[index]
                      : itemType == CustomStrings.mensClothing
                          ? controller.mensClothing[index]
                          : controller.womensClothing[index],
              odd: index,
            );
          }),
    ));
  }
}

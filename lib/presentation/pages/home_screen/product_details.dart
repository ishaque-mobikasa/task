import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/data/models/products/product_model.dart';
import 'package:task/presentation/pages/home_screen/widgets/product_card.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    ProductsModel model = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            model.category.toString().toUpperCase(),
            style: CustomStyle.style,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ProductCard(model: model),
        ),
      ),
    );
  }
}

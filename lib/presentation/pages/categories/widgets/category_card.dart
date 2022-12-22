import 'package:flutter/material.dart';
import 'package:task/data/models/products/product_model.dart';

class CategoryCard extends StatelessWidget {
  void Function()? onTap;
  TextStyle? style;
  String? topText;
  String? bottomText;
  ProductsModel? productsModel;
  CategoryCard(
      {super.key,
      this.style,
      this.bottomText,
      this.topText,
      this.onTap,
      this.productsModel}) {
    topText ?? (topText = "Top Text");
    bottomText ?? (bottomText = "Bottom Text");
    style ??
        (style = const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
            overflow: TextOverflow.ellipsis));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.all(10),
        height: size.height * 0.3,
        width: size.width * 0.5,
        decoration: BoxDecoration(border: Border.all()),
        child: LayoutBuilder(
            builder: (ctx, cstr) => Stack(
                  children: [
                    Card(
                      child: SizedBox(
                        height: size.height * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: productsModel == null
                                ? Image.asset(
                                    "assets/images/image4.jpg",
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(productsModel!.image!),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: cstr.maxWidth,
                        margin: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 0, left: 0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.black26,
                        ),
                        height: cstr.maxHeight * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(bottomText!, style: style),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: cstr.maxWidth,
                        margin: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 0, left: 0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.black26,
                        ),
                        height: cstr.maxHeight * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(topText!, style: style),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}

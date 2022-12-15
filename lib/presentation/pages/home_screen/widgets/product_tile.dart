import 'package:flutter/material.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/data/models/onBoard/products/product_model.dart';

class ProductTileSmall extends StatelessWidget {
  ProductTileSmall({super.key, required this.model, this.onTap});

  final ProductsModel model;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              model.category.toString(),
              maxLines: 1,
              style: CustomStyle.style.copyWith(fontSize: 14),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Image.network(
                      model.image.toString(),
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : SizedBox(
                                height: size.width * 0.2,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                )));
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
                child: SizedBox(
              width: 120,
              height: 50,
              child: Text(
                model.title.toString(),
                maxLines: 2,
                textAlign: TextAlign.center,
                style: CustomStyle.style.copyWith(fontSize: 14),
              ),
            )),
            Text(
              '\u{20B9}  ${model.price.toString()}',
              style: CustomStyle.style,
            )
          ],
        ),
      ),
    );
  }
}

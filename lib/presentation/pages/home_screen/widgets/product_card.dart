import 'package:flutter/material.dart';
import 'package:task/app/utils/app_colors.dart';
import 'package:task/app/utils/decorations.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/data/models/products/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});
  final ProductsModel product;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Column(children: [
        SizedBox(
          height: size.height * 0.4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.network(
              product.image.toString(),
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null
                    ? child
                    : SizedBox(
                        height: size.height * 0.5,
                        child: Center(
                            child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        )));
              },
              height: size.height * 0.1,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            width: size.width * 0.9,
            color: CustomColors.blackColor,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              product.title.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.center,
              maxLines: 3,
            )),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            product.description.toString(),
            maxLines: 6,
            style: CustomStyle.style.copyWith(),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: size.width,
          height: size.height * 0.1,
          decoration: BoxDecoration(border: Border.all()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.rate_review_rounded,
                    color: CustomColors.googleColor,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    child: Text(
                      "${product.rating!.rate} K Comments",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.thumb_up_sharp,
                    color: CustomColors.blueColor,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                    child: Text(
                      product.rating!.count.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    "\u{20B9}",
                    style: CustomStyle.style,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                    child: Text(
                      product.price.toString(),
                      style: CustomStyle.style
                          .copyWith(color: CustomColors.blackColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: AllDecoration().constDecorationBottom10.copyWith(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.themeColor),
                  child: TextButton(
                      onPressed: onTap,
                      child: Text("Add to Cart",
                          style: CustomStyle.style.copyWith(
                              color: CustomColors.whiteColor, fontSize: 25))),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

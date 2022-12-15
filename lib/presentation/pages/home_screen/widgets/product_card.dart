import 'package:flutter/material.dart';
import 'package:task/app/utils/app_colors.dart';
import 'package:task/app/utils/decorations.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/data/models/onBoard/products/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.model});
  final ProductsModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Column(children: [
        SizedBox(
          height: size.height * 0.4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: FittedBox(
              child: Image.network(
                model.image.toString(),
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
        ),
        Container(
            width: size.width * 0.9,
            color: CustomColors.blackColor,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              model.title.toString(),
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
            model.description.toString(),
            maxLines: 4,
            style: CustomStyle.style.copyWith(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text("${model.rating!.rate} K Comments"),
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
                    Text(model.rating!.count.toString())
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "\u{20B9}",
                      style: CustomStyle.style,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      model.price.toString(),
                      style: CustomStyle.style
                          .copyWith(color: CustomColors.blackColor),
                    )
                  ],
                ),
              ],
            ),
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
                      onPressed: () => {},
                      child: Text("Add to Cart",
                          style: CustomStyle.style.copyWith(
                              color: CustomColors.whiteColor, fontSize: 25))),
                ),
              ),
            ),
          ],
        ),
        const Spacer()
      ]),
    );
  }
}

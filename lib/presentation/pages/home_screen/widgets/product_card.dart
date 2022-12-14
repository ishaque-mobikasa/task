import 'package:flutter/material.dart';
import 'package:task/app/utils/app_colors.dart';
import 'package:task/app/utils/themes.dart';
import 'package:task/data/models/onBoard/products/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.model});
  final ProductsModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.network(
              model.image.toString(),
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null
                    ? child
                    : SizedBox(
                        height: size.height * 0.2,
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
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      const Icon(
                        Icons.attach_money,
                        color: CustomColors.instaColor,
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
        ]),
      ),
    );
  }
}

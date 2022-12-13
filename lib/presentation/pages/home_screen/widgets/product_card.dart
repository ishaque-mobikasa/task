import 'package:flutter/material.dart';
import 'package:task/data/models/onBoard/products/product_model.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.model});
  ProductsModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  // child: Image.asset(
                  //   "assets/images/splash_image.jpg",
                  //   fit: BoxFit.cover,
                  //   height: 150,
                  //   width: double.infinity,
                  // )
                  child:Image.network(
                    model.image.toString(),
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: const Text(
                        "Raajaa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    Icon(Icons.rate_review_rounded),
                    SizedBox(
                      width: 6,
                    ),
                    Text("Ratings")
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.thumb_up_sharp),
                    SizedBox(
                      width: 6,
                    ),
                    Text("Likes")
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text("100")
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

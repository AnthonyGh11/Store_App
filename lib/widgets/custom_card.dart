import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/update_product_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    super.key,
  });

  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip
            .none, // to make the picture show above the stack, not disappear when its height is bigger than the height of the container
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40, //controls the haziness of the shadow's border
                color: Colors.grey
                    .withOpacity(.2), //color of the shadow and the border of it
                spreadRadius: 0, //the amount of the spread of the shadow
                offset: const Offset(
                    10, 10), //direction of the spreading of the shadow
              ),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0,
                          6), // because some titles are way too big, we use this to only show the forst part of them if the title is too long
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            bottom: -60,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

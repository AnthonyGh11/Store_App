import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/get_all_products_service.dart';
import 'package:ecommerce_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.cartPlus))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "New Trend",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, //the number of columns that i want to show items on
                      childAspectRatio:
                          1.5, // the ratio of height and width of the widget, 1 by default, when the value decreases, the height increases and vice versa.
                      crossAxisSpacing:
                          10, //responsible for the spacing between the two products columns, between the left or the right of the card, modifying the x axis.
                      mainAxisSpacing:
                          100, // resposible for the spacing between the card and the one above it and under it, modifying the y axis
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}

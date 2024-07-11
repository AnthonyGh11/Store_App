import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/services/update_product.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall:
          isLoading, // responsible to show the circular loading animation
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Widget',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // lets the child of this widget only scroll, and makes the column take the height of its child
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextfield(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Description',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  hintText: 'Category',
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}

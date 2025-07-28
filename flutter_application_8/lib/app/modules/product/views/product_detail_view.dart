import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/modules/product/controllers/cart_controller.dart';
import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key});

  final CartController cartController = Get.find<CartController>();

  final ProductModel product = Get.arguments;

  final TextStyle textStyle = TextStyle(fontSize: 24.0, color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail"), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Name: ${product.name}", style: textStyle),

            SizedBox(height: 25.0),

            Text("Price: \$${product.price}", style: textStyle),

            ElevatedButton(
              onPressed: () {
                cartController.addtoCart(product);
                Get.snackbar(
                  "Add to cart",
                  "${product.name} added to your cart",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(milliseconds: 2000),
                  backgroundColor: Colors.blueGrey,
                  colorText: Colors.white,
                  showProgressIndicator: true,
                );
              },
              child: Text("Add to cart"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/modules/product/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("checkout_title".tr), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Thanks For purchase"),

            SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: () {
                cartController.clearCart();
                Get.offAllNamed("/product");
              },
              child: Text("Go to product"),
            ),
          ],
        ),
      ),
    );
  }
}

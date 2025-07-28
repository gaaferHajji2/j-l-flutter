import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout Page"), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Thanks For purchase"),

            SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: () {
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

import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:get/get.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  final ProductModel product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail"), centerTitle: true),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Name: ${product.name}"),

          SizedBox(height: 25.0),

          Text("Price: \$${product.price}"),
        ],
      ),
    );
  }
}

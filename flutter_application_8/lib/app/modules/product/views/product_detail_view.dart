import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatelessWidget {
  ProductDetailView({super.key});

  final ProductModel product = Get.arguments;

  final TextStyle textStyle = TextStyle(fontSize: 24.0, color: Colors.blueGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Detail"), centerTitle: true),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Name: ${product.name}", style: textStyle),

          SizedBox(height: 25.0),

          Text("Price: \$${product.price}", style: textStyle),
        ],
      ),
    );
  }
}

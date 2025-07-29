import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/modules/product/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed("/cart");
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = productController.products[index];

            return ListTile(
              title: Text(product.title),
              subtitle: Text("\$${product.price}"),
              onTap: () {
                Get.toNamed("/product-detailed", arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}

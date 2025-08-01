import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/modules/product/controllers/product_controller.dart';
import 'package:flutter_application_8/app/services/theme_service.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product_title".tr),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed("/cart");
            },
            icon: Icon(Icons.shopping_cart),
          ),

          IconButton(
            onPressed: () {
              if (Get.locale == Locale('en', 'US')) {
                Get.updateLocale(Locale('ar', 'JL'));
              } else {
                Get.updateLocale(Locale('en', 'US'));
              }
            },
            icon: Icon(Icons.language),
          ),

          IconButton(
            onPressed: () {
              ThemeService().switchTheme();
            },
            icon: Icon(Icons.brightness_7_sharp),
          ),
        ],
      ),

      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (productController.errMsg.isNotEmpty) {
          return Center(child: Text(productController.errMsg.value));
        }

        return ListView.builder(
          itemCount: productController.productsList.length,
          itemBuilder: (BuildContext context, int index) {
            final product = productController.productsList[index];

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

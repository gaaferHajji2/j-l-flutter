import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:flutter_application_8/app/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  final ProductService productService;

  ProductController({required this.productService});

  @override
  void onInit() {
    products.addAll([
      ProductModel(title: "JLoka Product-01", price: 150.5),
      ProductModel(title: "JLoka Product-02", price: 200.5),
      ProductModel(title: "JLoka Product-02", price: 300.5),
    ]);

    super.onInit();
  }
}

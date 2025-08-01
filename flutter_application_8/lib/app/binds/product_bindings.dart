import 'package:flutter_application_8/app/modules/product/controllers/cart_controller.dart';
import 'package:flutter_application_8/app/modules/product/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(CartController());
  }
}

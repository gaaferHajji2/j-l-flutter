import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:flutter_application_8/app/services/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartService cartService = Get.find<CartService>();

  List<ProductModel> get cartItems => cartService.cartItems;

  double get totalAmount => cartService.totalAmount;

  void addtoCart(ProductModel product) {
    cartService.addtoCart(product);
  }

  void removeFromCart(ProductModel product) {
    cartService.removeFromCart(product);
  }

  void clearCart() {
    cartService.clearCart();
  }
}

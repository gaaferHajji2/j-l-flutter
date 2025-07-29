import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:flutter_application_8/app/services/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartService cartService = Get.find<CartService>();

  var cartItems = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;

  void addtoCart(ProductModel product) {
    cartService.addtoCart(product);
    // calculateTotal();
  }

  void removeFromCart(ProductModel product) {
    cartService.removeFromCart(product);
    // calculateTotal();
  }

  // void calculateTotal() {
  //   totalAmount.value = cartItems.fold(0.0, (sum, item) => sum + item.price);
  // }

  void clearCart() {
    cartService.clearCart();
  }
}

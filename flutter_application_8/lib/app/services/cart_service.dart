import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartService extends GetxService {
  final cartStorage = GetStorage();

  var cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    List? storedCart = cartStorage.read<List>("cartItems");

    if (storedCart != null) {
      cartItems.assignAll(
        storedCart.map((e) => ProductModel.fromJson(e)).toList(),
      );
    }

    ever(cartItems, (_) {
      cartStorage.write("cartItems", cartItems.map((e) => e.toJson()).toList());
    });
  }

  void addtoCart(ProductModel product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  double get totalAmount =>
      cartItems.fold(0.0, (sum, item) => sum + item.price);

  void clearCart() {
    cartItems.clear();
  }
}

import 'package:flutter_shop/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  List<CartItem> getCartItems();
  void addItem(CartItem item);
  void removeItem(String productId);
  void updateQuantity(String productId, int quantity);
  void clearCart();
  double getTotal();
}

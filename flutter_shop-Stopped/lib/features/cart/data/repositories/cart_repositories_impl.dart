import 'package:flutter_shop/features/cart/domain/entities/cart_item.dart';
import 'package:flutter_shop/features/cart/domain/repositories/cart_repositories.dart';

class CartRepositoryImpl implements CartRepository {
  final List<CartItem> _items = [];

  @override
  List<CartItem> getCartItems() => List.unmodifiable(_items);

  @override
  void addItem(CartItem item) {
    final existing = _items.indexWhere((i) => i.product.id == item.product.id);
    if (existing != -1) {
      _items[existing] = _items[existing].copyWith(
        quantity: _items[existing].quantity + item.quantity,
      );
    } else {
      _items.add(item);
    }
  }

  @override
  void removeItem(String productId) {
    _items.removeWhere((i) => i.product.id == productId);
  }

  @override
  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((i) => i.product.id == productId);
    if (index != -1) {
      if (quantity > 0) {
        _items[index] = _items[index].copyWith(quantity: quantity);
      } else {
        _items.removeAt(index);
      }
    }
  }

  @override
  void clearCart() => _items.clear();

  @override
  double getTotal() => _items.fold(0, (sum, item) => sum + item.totalPrice);
}

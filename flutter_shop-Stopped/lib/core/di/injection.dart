import 'package:flutter_shop/features/cart/data/repositories/cart_repositories_impl.dart';
import 'package:flutter_shop/features/cart/domain/repositories/cart_repositories.dart';
import 'package:flutter_shop/features/order/data/presentation/order_repository_impl.dart';
import 'package:flutter_shop/features/order/domain/repositories/order_repository.dart';
import 'package:flutter_shop/features/product/data/repositories/product_repository_impl.dart';

class Injection {
  static final ProductRepositoryImpl productRepository =
      ProductRepositoryImpl();
  static final CartRepository cartRepository = CartRepositoryImpl();
  static final OrderRepository orderRepository = OrderRepositoryImpl();
}

import 'package:flutter_shop/features/product/data/repositories/product_repository_impl.dart';

class Injection {
  static final ProductRepositoryImpl productRepository =
      ProductRepositoryImpl();
  // static final CartRepository cartRepository = CartRepositoryImpl();
  // static final OrderRepository orderRepository = OrderRepositoryImpl();
}

class Injection {
  static final ProductRepository productRepository = ProductRepositoryImpl();
  static final CartRepository cartRepository = CartRepositoryImpl();
  static final OrderRepository orderRepository = OrderRepositoryImpl();
}

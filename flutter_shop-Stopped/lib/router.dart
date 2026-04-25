import 'package:flutter_shop/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_shop/features/order/presentation/pages/order_detail_page.dart';
import 'package:flutter_shop/features/order/presentation/pages/order_history_page.dart';
import 'package:flutter_shop/features/product/presentation/pages/home_page.dart';
import 'package:flutter_shop/features/product/presentation/pages/product_detail_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, _) => const HomePage()),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) =>
          ProductDetailPage(productId: state.pathParameters['id']!),
    ),
    GoRoute(path: '/cart', builder: (_, _) => const CartPage()),
    GoRoute(path: '/orders', builder: (_, _) => const OrderHistoryPage()),
    GoRoute(
      path: '/order/:id',
      builder: (context, state) =>
          OrderDetailPage(orderId: state.pathParameters['id']!),
    ),
  ],
);

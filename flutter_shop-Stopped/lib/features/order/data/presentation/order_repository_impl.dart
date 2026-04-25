import 'package:flutter_shop/core/config/app_config.dart';
import 'package:flutter_shop/features/order/domain/entities/order.dart';
import 'package:flutter_shop/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final List<Order> _orders = List.from(dummyOrders); // Dummy history

  @override
  Future<void> addOrder(Order order) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _orders.insert(0, order);
  }

  @override
  Future<List<Order>> getOrders() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _orders;
  }
}

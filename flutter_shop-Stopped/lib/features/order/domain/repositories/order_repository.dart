import '../entities/order.dart';

abstract class OrderRepository {
  Future<void> addOrder(Order order);
  Future<List<Order>> getOrders();
}

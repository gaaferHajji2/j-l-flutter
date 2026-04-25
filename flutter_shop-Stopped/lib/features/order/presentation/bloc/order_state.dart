import 'package:equatable/equatable.dart';
import 'package:flutter_shop/features/order/domain/entities/order.dart';

abstract class OrderState extends Equatable {
  const OrderState();
  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrdersLoaded extends OrderState {
  final List<Order> orders;
  const OrdersLoaded(this.orders);
}

class OrderPlaced extends OrderState {
  final Order order;
  const OrderPlaced(this.order);
}

class OrderError extends OrderState {
  final String message;
  const OrderError(this.message);
}

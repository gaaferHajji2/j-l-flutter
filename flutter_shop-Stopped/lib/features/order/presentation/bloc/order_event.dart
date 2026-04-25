import 'package:equatable/equatable.dart';
import 'package:flutter_shop/features/cart/domain/entities/cart_item.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
  @override
  List<Object> get props => [];
}

class PlaceOrder extends OrderEvent {
  final List<CartItem> items;
  final double total;
  const PlaceOrder(this.items, this.total);
}

class LoadOrders extends OrderEvent {}

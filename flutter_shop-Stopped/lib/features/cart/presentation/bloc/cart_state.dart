import 'package:equatable/equatable.dart';
import 'package:flutter_shop/features/cart/domain/entities/cart_item.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  final double total;
  const CartLoaded(this.items, this.total);
  @override
  List<Object?> get props => [items, total];
}

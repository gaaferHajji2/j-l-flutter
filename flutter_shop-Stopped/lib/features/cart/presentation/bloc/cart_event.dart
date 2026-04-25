import 'package:equatable/equatable.dart';
import 'package:flutter_shop/features/cart/domain/entities/cart_item.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final CartItem item;
  const AddToCart(this.item);
}

class RemoveFromCart extends CartEvent {
  final String productId;
  const RemoveFromCart(this.productId);
}

class UpdateQuantity extends CartEvent {
  final String productId;
  final int quantity;
  const UpdateQuantity(this.productId, this.quantity);
}

class ClearCart extends CartEvent {}

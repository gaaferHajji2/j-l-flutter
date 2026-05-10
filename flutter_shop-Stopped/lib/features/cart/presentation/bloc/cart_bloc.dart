import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/features/cart/domain/repositories/cart_repositories.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
    // Initial load
    _loadCart();
  }

  void _loadCart() {
    emit(CartLoaded(repository.getCartItems(), repository.getTotal()));
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    repository.addItem(event.item);
    emit(CartLoaded(repository.getCartItems(), repository.getTotal()));
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    repository.removeItem(event.productId);
    emit(CartLoaded(repository.getCartItems(), repository.getTotal()));
  }

  Future<void> _onUpdateQuantity(
    UpdateQuantity event,
    Emitter<CartState> emit,
  ) async {
    repository.updateQuantity(event.productId, event.quantity);
    emit(CartLoaded(repository.getCartItems(), repository.getTotal()));
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    repository.clearCart();
    emit(CartLoaded([], 0));
  }
}

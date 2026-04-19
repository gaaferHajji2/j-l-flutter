import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/features/order/domain/entities/order.dart';
import 'package:flutter_shop/features/order/domain/repositories/order_repository.dart';
import 'package:uuid/uuid.dart';
import 'order_event.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository repository;

  OrderBloc(this.repository) : super(OrderInitial()) {
    on<PlaceOrder>(_onPlaceOrder);
    on<LoadOrders>(_onLoadOrders);
  }

  Future<void> _onPlaceOrder(PlaceOrder event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final order = Order(
        id: const Uuid().v4(), // from core
        items: event.items,
        total: event.total,
        date: DateTime.now(),
      );
      await repository.addOrder(order);
      emit(OrderPlaced(order));
      // Reload orders
      add(LoadOrders());
    } catch (e) {
      emit(OrderError('Failed to place order'));
    }
  }

  Future<void> _onLoadOrders(LoadOrders event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final orders = await repository.getOrders();
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrderError('Failed to load orders'));
    }
  }
}

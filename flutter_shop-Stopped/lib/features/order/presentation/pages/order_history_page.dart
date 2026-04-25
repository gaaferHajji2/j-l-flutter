import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/core/di/injection.dart';
import 'package:flutter_shop/features/order/presentation/bloc/order_bloc.dart';
import 'package:flutter_shop/features/order/presentation/bloc/order_event.dart';
import 'package:flutter_shop/features/order/presentation/bloc/order_state.dart';
import 'package:go_router/go_router.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderBloc(Injection.orderRepository)..add(LoadOrders()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Orders')),
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is OrderError) {
              return Center(child: Text(state.message));
            }
            if (state is OrdersLoaded) {
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return ListTile(
                    title: Text('Order #${order.id.substring(0, 8)}'),
                    subtitle: Text(
                      '${order.formattedDate} • ${order.status.toUpperCase()}',
                    ),
                    trailing: Text('\$${order.total.toStringAsFixed(2)}'),
                    onTap: () => context.push('/order/${order.id}'),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

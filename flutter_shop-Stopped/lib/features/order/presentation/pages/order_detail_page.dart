import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/core/di/injection.dart';
import 'package:flutter_shop/features/order/presentation/bloc/order_bloc.dart';
import 'package:flutter_shop/features/order/presentation/bloc/order_event.dart';
import 'package:flutter_shop/features/order/presentation/bloc/order_state.dart';

class OrderDetailPage extends StatelessWidget {
  final String orderId;
  const OrderDetailPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderBloc(Injection.orderRepository)..add(LoadOrders()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Order Detail')),
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrdersLoaded) {
              final order = state.orders.firstWhere((o) => o.id == orderId);
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    'Order #${order.id.substring(0, 8)}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text('Date: ${order.formattedDate}'),
                  Text('Status: ${order.status.toUpperCase()}'),
                  const Divider(),
                  ...order.items.map(
                    (item) => ListTile(
                      title: Text(item.product.name),
                      trailing: Text(
                        '${item.quantity} × \$${item.product.price}',
                      ),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total'),
                      Text('\$${order.total.toStringAsFixed(2)}'),
                    ],
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

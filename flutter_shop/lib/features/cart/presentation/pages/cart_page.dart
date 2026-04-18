import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/core/di/injection.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_event.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_state.dart';
import 'package:flutter_shop/features/cart/presentation/widgets/cart_item_tile.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(Injection.cartRepository),
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoaded) {
              if (state.items.isEmpty) {
                return const Center(child: Text('Your cart is empty'));
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) =>
                          CartItemTile(item: state.items[index]),
                    ),
                  ),
                  // OPTIMIZATION: BlocSelector for total only
                  BlocSelector<CartBloc, CartState, double>(
                    selector: (s) => s is CartLoaded ? s.total : 0,
                    builder: (context, total) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '\$${total.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<OrderBloc>().add(
                                    PlaceOrder(state.items, total),
                                  );
                                  context.read<CartBloc>().add(ClearCart());
                                  context.go('/orders');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Order placed successfully!',
                                      ),
                                    ),
                                  );
                                },
                                child: const Text('Checkout'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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

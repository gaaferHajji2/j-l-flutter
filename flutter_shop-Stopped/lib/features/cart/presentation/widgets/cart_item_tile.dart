import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/features/cart/domain/entities/cart_item.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_event.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        item.product.imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
      title: Text(item.product.name),
      subtitle: Text(
        '\$${item.product.price.toStringAsFixed(2)} × ${item.quantity}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => context.read<CartBloc>().add(
              UpdateQuantity(item.product.id, item.quantity - 1),
            ),
          ),
          Text('${item.quantity}'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.read<CartBloc>().add(
              UpdateQuantity(item.product.id, item.quantity + 1),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () =>
                context.read<CartBloc>().add(RemoveFromCart(item.product.id)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/features/cart/domain/entities/cart_item.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_event.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_state.dart';
import 'package:flutter_shop/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_shop/core/di/injection.dart';
import 'package:flutter_shop/features/product/presentation/bloc/product_event.dart';
import 'package:flutter_shop/features/product/presentation/bloc/product_state.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductBloc(Injection.productRepository)
            ..add(LoadProductDetail(productId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Product Detail')),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductError) {
              return Center(child: Text(state.message));
            }
            if (state is ProductDetailLoaded) {
              final product = state.product;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      product.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),

                          const SizedBox(height: 16),

                          Text(product.description),

                          const SizedBox(height: 24),
                          // OPTIMIZATION: Use BlocSelector so only button rebuilds on cart change
                          BlocSelector<CartBloc, CartState, bool>(
                            selector: (cartState) {
                              if (cartState is CartLoaded) {
                                return cartState.items.any(
                                  (item) => item.product.id == product.id,
                                );
                              }
                              return false;
                            },
                            builder: (context, isInCart) {
                              return SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                      AddToCart(CartItem(product: product)),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Added to cart!'),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    isInCart
                                        ? 'Already in Cart'
                                        : 'Add to Cart',
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

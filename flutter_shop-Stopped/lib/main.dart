import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/core/di/injection.dart';
import 'package:flutter_shop/core/theme/app_theme.dart';
import 'package:flutter_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_shop/features/order/presentation/bloc/order_bloc.dart';
import 'package:flutter_shop/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc(Injection.cartRepository)),
        BlocProvider(create: (_) => OrderBloc(Injection.orderRepository)),
      ],
      child: MaterialApp.router(
        title: 'FlutterShop',
        theme: appTheme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

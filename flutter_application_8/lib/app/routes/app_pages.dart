import 'package:flutter_application_8/app/binds/cart_binding.dart';
import 'package:flutter_application_8/app/binds/product_bindings.dart';
import 'package:flutter_application_8/app/modules/product/views/cart_view.dart';
import 'package:flutter_application_8/app/modules/product/views/checkout_view.dart';
import 'package:flutter_application_8/app/modules/product/views/product_detail_view.dart';
import 'package:flutter_application_8/app/modules/product/views/product_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductView(),
      binding: ProductBindings(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
      binding: CartBinding(),
    ),
    GetPage(name: Routes.CART, page: () => CartView()),
    GetPage(name: Routes.CHECKOUT, page: () => CheckoutView()),
  ];
}

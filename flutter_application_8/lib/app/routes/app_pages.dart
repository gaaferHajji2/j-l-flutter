import 'package:flutter_application_8/app/modules/product/views/product_detail_view.dart';
import 'package:flutter_application_8/app/modules/product/views/product_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.PRODUCt, page: () => ProductView()),
    GetPage(name: Routes.PRODUCT_DETAIL, page: () => ProductDetailView()),
  ];
}

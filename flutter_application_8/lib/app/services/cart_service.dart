import 'package:flutter_application_8/app/modules/product/models/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartService extends GetxService {
  final cartStorage = GetStorage();

  var cartItems = <ProductModel>[].obs;
}

import 'package:get/get.dart';

class AppTrans extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": {
      "product_title": "Products screen",
      "cart_title": "Cart screen",
      "product_detail_title": "Product detail screen",
      "checkout_title": "Checkout screen",
    },
    "ar_JL": {
      "product_title": "صفحة المنتجات",
      "cart_title": "صفحة البطاقة",
      "product_detail_title": "صفحة تفاصيل المنتج",
      "checkout_title": "صفحة الحساب",
    },
  };
}

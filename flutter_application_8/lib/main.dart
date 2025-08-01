import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/modules/product/controllers/cart_controller.dart';
import 'package:flutter_application_8/app/routes/app_pages.dart';
import 'package:flutter_application_8/app/services/cart_service.dart';
import 'package:flutter_application_8/app/services/translation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  Get.put(CartService());

  Get.put(CartController());

  debugPrint("After init all controllers and storage and service");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Product App",
      initialRoute: Routes.PRODUCT,
      translations: AppTrans(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),

      getPages: [...AppPages.routes],
      debugShowCheckedModeBanner: false,
    );
  }
}

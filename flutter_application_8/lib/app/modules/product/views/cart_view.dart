import 'package:flutter/material.dart';
import 'package:flutter_application_8/app/modules/product/controllers/cart_controller.dart';
import 'package:flutter_application_8/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    debugPrint("The Cart Controller is: ${cartController.cartItems}");
    debugPrint("The Cart Controller is: ${cartController.totalAmount}");

    return Scaffold(
      appBar: AppBar(title: Text("cart_title".tr), centerTitle: true),

      body: Column(
        children: <Widget>[
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final cartItem = cartController.cartItems[index];
                  return ListTile(
                    title: Text(cartItem.title),
                    subtitle: Text("\$${cartItem.price}"),
                    trailing: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Remove Item",
                          middleText:
                              "Are you sure to remove ${cartItem.title}?",
                          textConfirm: "Ok",
                          textCancel: "cancel",
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            cartController.removeFromCart(cartItem);
                            Get.back(); // to pop up the dialog from screen
                          },
                          onCancel: () {},
                        );
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  );
                },
              );
            }),
          ),

          Obx(() {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Total: ${cartController.totalAmount.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 24.0, color: Colors.blueGrey),
              ),
            );
          }),

          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.CHECKOUT);
            },
            child: Text("Checkout"),
          ),
        ],
      ),
    );
  }
}

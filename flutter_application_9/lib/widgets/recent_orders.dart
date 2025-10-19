import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';
import 'package:flutter_food_delivery_ui/widgets/order_item.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Your Orders",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              letterSpacing: 1.5,
            ),
          ),

          Container(
            height: 150.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = currentUser.orders[index];
                return OrderItem(ctx: context, order: order);
              },
            ),
          ),
        ],
      ),
    );
  }
}

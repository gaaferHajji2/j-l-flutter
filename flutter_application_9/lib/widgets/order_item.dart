import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class OrderItem extends StatelessWidget {
  final BuildContext ctx;
  final Order order;

  const OrderItem({super.key, required this.ctx, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      width: 350.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.2, color: Colors.grey[200]!),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: AssetImage(order.food.imageUrl),
                  width: 115,
                  // height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 5.0),

              Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // food name
                    Text(
                      order.food.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 5.0),

                    // restaurant name
                    Text(
                      order.restaurant.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 5.0),

                    // order date
                    Text(
                      order.date,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(ctx).primaryColor,
            ),
            child: Center(
              child: Icon(Icons.add, color: Colors.white, size: 35.0),
            ),
          ),
        ],
      ),
    );
  }
}

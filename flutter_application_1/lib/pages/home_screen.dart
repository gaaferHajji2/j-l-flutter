import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';
import 'package:flutter_food_delivery_ui/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Deleivery"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.account_circle, color: Colors.white),
          iconSize: 24.0,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          // Search Field
          SearchWidget(),

          OrdersList(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Restaurants Food UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

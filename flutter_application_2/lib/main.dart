import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/MainPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        backgroundColor: Colors.teal, 
        body: MainPage(),
      ),
    );
  }
}

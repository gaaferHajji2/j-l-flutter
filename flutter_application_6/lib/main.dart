import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants.dart';
import 'package:flutter_application_6/screens/input_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Constants.kPrimaryColor,
        scaffoldBackgroundColor: Constants.kScaffoldBackgroundColor,
      ),
      home: InputPage(),
    );
  }
}
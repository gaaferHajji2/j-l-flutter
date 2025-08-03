import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(const DeliveroApp());
}

class DeliveroApp extends StatelessWidget {
  const DeliveroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "lato",
      ),
      home: const Center(child: Text('Flutter Demo Home Page')),
    );
  }
}

import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> images = [
    "assets/dice1.png",
    "assets/dice2.png",
    "assets/dice3.png",
    "assets/dice4.png",
    "assets/dice5.png",
    "assets/dice6.png"
  ];

  int index1 = Random.secure().nextInt(6);
  int index2 = Random.secure().nextInt(6);

  int getRandomNumber() {
    return Random.secure().nextInt(6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Diceee",
          style: TextStyle(
            letterSpacing: 15.0,
          ),
        ),
        centerTitle: true,
        elevation: 15.0,
        shadowColor: Colors.black,
        titleSpacing: 15.0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    index1 = getRandomNumber();
                  });
                },
                child: Image.asset(
                  images[index1],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                ),
                onPressed: (){
                  setState(() {
                    index2 = getRandomNumber();
                  });
                },
                child: Image.asset(images[index2]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

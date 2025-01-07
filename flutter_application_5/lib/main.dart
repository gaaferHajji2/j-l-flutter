import 'package:flutter/material.dart';

import 'package:flutter_application_5/utilities/generateAnswer.dart';
import 'package:flutter_application_5/widget/QuizButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'َQuiz Application'),
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
  int index = 0;

  final List<String> questions = [
    "My Name is Jafar Loka",
    "I am Web Developer",
    "I am Mobile Developer",
    "I am Junior Web Full Stack Develoepr",
    "I am Junior Mobile Full Stack Developer",
    "I Love Programming",
    "I Want To Learn Every Thing",
    "You Have Complete The Quiz",
  ];

  String result = "";

  void onPressCallback(int t1) {
    if (index != 7) {
      setState(() {
        ++index;

        int answer = generateAnswer();

        if (answer == t1) {
          result = result + " 💚 ";
        } else {
          result = result + " ❌ ";
        }
      });
    }
  }

  void onResetCallback() {
    setState(() {
      index = 0;

      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // SizedBox(
          //   height: 50.0,
          // ),

          // 1--> First Widget.
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  questions[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),

          Column(
            children: <Widget>[
              // 2--> Second Widget.
              QuizButton(
                btnText: "Yes",
                btnColor: Colors.green,
                onPressCallback: () => onPressCallback(1),
              ),

              // 3--> Third Widget.
              QuizButton(
                btnText: "No",
                btnColor: Colors.red,
                onPressCallback: () => onPressCallback(0),
              ),

              QuizButton(
                btnText: "Reset",
                btnColor: Colors.lightGreenAccent,
                onPressCallback: onResetCallback,
              ),

              // 4--> Fourth Widget.
              Text(
                result,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

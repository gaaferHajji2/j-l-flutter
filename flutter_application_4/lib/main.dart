import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter_application_4/widgets/ListItem.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AudioPlayer player = new AudioPlayer();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Jafar Test Audio Package.',
        player: player,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.player});

  final String title;

  final AudioPlayer player;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    widget.player.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {

    widget.player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListItem(
              player: widget.player,
              audioFile: "note1.wav",
              red: 255,
              green: 0,
              blue: 0,
            ),

            ListItem(
              player: widget.player,
              audioFile: "note2.wav",
              red: 0,
              green: 255,
              blue: 0,
            ),

            ListItem(
              player: widget.player,
              audioFile: "note3.wav",
              red: 0,
              green: 0,
              blue: 255,
            ),

            ListItem(
              player: widget.player,
              audioFile: "note4.wav",
              red: 40,
              green: 125,
              blue: 255,
            ),

            ListItem(
              player: widget.player,
              audioFile: "note5.wav",
              red: 125,
              green: 125,
              blue: 50,
            ),

            ListItem(
              player: widget.player,
              audioFile: "note6.wav",
              red: 255,
              green: 125,
              blue: 50,
            ),

            ListItem(
              player: widget.player,
              audioFile: "note7.wav",
              red: 255,
              green: 125,
              blue: 125,
            ),
          ],
        ),
      ),
    );
  }
}

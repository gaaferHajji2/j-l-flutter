import 'package:flutter/material.dart';

class AnimatedTextStyleSample extends StatefulWidget {
  const AnimatedTextStyleSample({super.key});

  @override
  State<AnimatedTextStyleSample> createState() =>
      _AnimatedTextStyleSampleState();
}

class _AnimatedTextStyleSampleState extends State<AnimatedTextStyleSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Text Style Sample')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Text("Jafar Loka Sample Data")],
      ),
    );
  }
}

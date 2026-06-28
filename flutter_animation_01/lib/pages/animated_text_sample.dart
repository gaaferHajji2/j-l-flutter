import 'package:flutter/material.dart';

class AnimatedTextStyleSample extends StatefulWidget {
  const AnimatedTextStyleSample({super.key});

  @override
  State<AnimatedTextStyleSample> createState() =>
      _AnimatedTextStyleSampleState();
}

class _AnimatedTextStyleSampleState extends State<AnimatedTextStyleSample> {
  double fontSize = 10.0;
  Color? textColor = Colors.grey[400];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Text Style Sample')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedDefaultTextStyle(
            style: TextStyle(fontSize: fontSize, color: textColor),
            duration: Duration(milliseconds: 500),
            curve: Curves.elasticInOut,
            child: Text("Jafar Loka Text"),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    fontSize = 24.0;
                    textColor = Colors.orange[400];
                  });
                },
                icon: Icon(Icons.add),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    fontSize = 10.0;
                    textColor = Colors.grey[400];
                  });
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OpacityAnimationSample extends StatefulWidget {
  const OpacityAnimationSample({super.key});

  @override
  State<OpacityAnimationSample> createState() => _OpacityAnimationSampleState();
}

class _OpacityAnimationSampleState extends State<OpacityAnimationSample> {
  double _textOpacity = 1.0;
  double _jerryOpacity = 1.0;
  double _tomOpacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Opacity Animation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _textOpacity,
              duration: Duration(milliseconds: 700),
              child: Text("Jafar Loka Test"),
              onEnd: () {
                setState(() {
                  if (_jerryOpacity <= 0.0) {
                    _jerryOpacity = 1.0;
                  } else {
                    _jerryOpacity = 0.0;
                  }
                });
              },
            ),

            SizedBox(height: 35.0),

            AnimatedOpacity(
              opacity: _jerryOpacity,
              duration: Duration(milliseconds: 500),
              child: Image.asset("assets/jerry.png", width: 100, height: 100),
              onEnd: () {
                setState(() {
                  if (_tomOpacity <= 0.0) {
                    _tomOpacity = 1.0;
                  } else {
                    _tomOpacity = 0.0;
                  }
                });
              },
            ),

            SizedBox(height: 35.0),

            AnimatedOpacity(
              opacity: _tomOpacity,
              duration: Duration(milliseconds: 300),
              child: Image.asset("assets/tom.png", width: 100, height: 100),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_textOpacity <= 0.0) {
              _textOpacity = 1.0;
            } else {
              _textOpacity = 0.0;
            }
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}

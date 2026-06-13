import 'package:flutter/material.dart';

class AlignmentAnimationSample extends StatefulWidget {
  const AlignmentAnimationSample({super.key});

  @override
  State<AlignmentAnimationSample> createState() =>
      _AlignmentAnimationSampleState();
}

class _AlignmentAnimationSampleState extends State<AlignmentAnimationSample> {
  int _jerryAligned = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Alignment Sample")),
      body: Stack(
        children: <Widget>[
          AnimatedAlign(
            alignment: getNextAlignment(_jerryAligned),
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 65,
              height: 100,
              color: Colors.transparent,
              child: Image.asset("assets/tom.png"),
            ),
          ),

          AnimatedAlign(
            alignment: getNextAlignment(_jerryAligned + 1),
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 65,
              height: 100,
              color: Colors.transparent,
              child: Image.asset("assets/jerry.png"),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _jerryAligned += 1;
          });
        },
        child: Icon(Icons.shuffle),
      ),
    );
  }

  Alignment getNextAlignment(int alignemt) {
    switch (alignemt) {
      case 1:
        return Alignment.topCenter;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.centerLeft;
      case 4:
        return Alignment.center;
      case 5:
        return Alignment.centerRight;
      case 6:
        return Alignment.bottomLeft;
      case 7:
        return Alignment.bottomCenter;
      case 8:
        return Alignment.bottomRight;
      default:
        _jerryAligned = 0;
        return Alignment.topLeft;
    }
  }
}

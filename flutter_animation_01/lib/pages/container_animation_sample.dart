import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContainerAnimationSample extends StatefulWidget {
  const ContainerAnimationSample({super.key});

  @override
  State<ContainerAnimationSample> createState() =>
      _ContainerAnimationSampleState();
}

class _ContainerAnimationSampleState extends State<ContainerAnimationSample> {
  double _width = 200;
  double _height = 200;
  Color? _backgroundColor = Colors.grey[400];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container Animation Sample")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _width = 400;
              _height = 400;
              _backgroundColor = Colors.orange[400];
            });
          },
          child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: Duration(milliseconds: 500),
            color: _backgroundColor,
            child: Image.asset(
              "assets/jerry.png",
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _width = 200;
            _height = 200;
            _backgroundColor = Colors.grey[400];
          });
        },
      ),
    );
  }
}

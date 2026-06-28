import 'package:flutter/material.dart';

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
  double _radius = 25.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container Animation Sample")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _width = 300;
              _height = 300;
              _backgroundColor = Colors.orange[400];
              _radius = 0.0;
            });
          },
          child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: _backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(_radius)),
            ),
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
            _radius = 25.0;
          });
        },
      ),
    );
  }
}

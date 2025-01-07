import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150.0,
            height: 100.0,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('assets/cake.jpg'), fit: BoxFit.fill),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(75.0),
            child: Image(
              // color: Colors.transparent,
              image: AssetImage(
                "assets/cake.jpg",
              ),
              width: 150.0,
              height: 150.0,
              fit: BoxFit.fill,
            ),
          ),

        ],
      ),
    );
  }
}

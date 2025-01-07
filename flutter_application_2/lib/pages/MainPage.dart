import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 1--> The Circle Profile Image.
          CircleAvatar(
            radius: 75.0,
            backgroundImage: AssetImage("assets/cake.jpg"),
          ),
      
          // 2-1--> My Name.
          Text(
            'Jafar Loka',
            style: TextStyle(
              color: Colors.red,
              fontSize: 50.0,
              fontFamily: 'Nabla',
              fontWeight: FontWeight.w900,
            ),
          ),
      
          SizedBox(
            height: 10,
          ),
      
          // 2-2--> Job Title.
          Text(
            'Junior Mobile And Web Full Stack Developer',
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 20.0,
              color: Colors.white,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
      
          SizedBox(
            height: 10.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
              thickness: 3.0,
            ),
          ),
      
          // 3--> Contact Information.
      
          // 3-1--> Mobile Number.
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(1, 0.5),
                  blurRadius: 1.0,
                  spreadRadius: 0.5
                )
              ],
            ),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                size: 24.0,
                color: Colors.teal,
              ),
              title: Text(
                "+963 993 032 631",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      
          // 3-2--> Mobile Number.
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(1, 0.5),
                  blurRadius: 1.0,
                  spreadRadius: 0.5
                )
              ],
            ),
            child: ListTile(
              leading: Icon(
                Icons.email,
                size: 24.0,
                color: Colors.teal,
              ),
              title: Text(
                "gaafer.hajji1995@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

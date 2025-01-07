import 'package:flutter/material.dart';

class Constants {
  static const Color kActiveCardColor = Color(0xFF1D1E33);

  static const Color kInactiveCardColor = Color(0xFF111328);

  static const Color kWhiteColor = Colors.white;

  static const double kBottomContainerHeight = 80.0;

  static const Color kBottomContainerColor = Color(0xFFEB1555);

  static const Color kTextTitleColor = Color.fromARGB(255, 141, 142, 152);

  static const TextStyle kLabelTextStyle = TextStyle(
            fontSize: 18.0,
            color: Constants.kTextTitleColor,
          );

  static const TextStyle kTitleWhiteTextStyle = TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          );

  static const TextStyle kNumberTextStyle = TextStyle(
            fontSize: 50.0,
            color: Constants.kWhiteColor,
            fontWeight: FontWeight.w900
  );
  
  static const Color kPrimaryColor = Color(0xFF0A0E21);

  static const Color kScaffoldBackgroundColor = Color(0xFF0A0E21);

  static const int kHeightConstValue = 180;

  static const double kMinSliderValue = 120.0;

  static const double kMaxSliderValue = 220.0;

  // static const Color kActiveSliderColor = Color(0xFFEB1555);

  // static const Color kInActiveSliderColor = Color(0xFF8D8E98);

  static const Color kSliderActiveColor = Colors.white;

  static const Color kSliderInActiveColor = Color(0xFF8D8E98);

  static const Color kSliderThumbColor = Color(0xFFEB1555);

  static const Color kSliderOverlayColor = Color.fromARGB(41, 255, 132, 169);

  static const int kWeight = 60;

  static const kLargeButtonTextStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
  );

  static const kResultTextStyle = TextStyle(
    color: Color(0xFF24D876),
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  static const kBMITextStyle = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
  );

  static const kBodyTextStyle = TextStyle(
    fontSize: 22.0,
  );

}
import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants.dart';

class BottomButton extends StatelessWidget {

  final VoidCallback onTap;

  final String buttonTitle;

  BottomButton({ required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Constants.kBottomContainerColor,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        height: Constants.kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: Constants.kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants.dart';

class FirstWidget extends StatelessWidget {
  final IconData icon;

  final String title;

  final Color? iconColor;

  final int selectedIndex;

  final int selectedValue;

  const FirstWidget({
    required this.icon,
    required this.title,
    this.iconColor = Constants.kWhiteColor,
    this.selectedIndex = 0,
    this.selectedValue = -1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: 80.0,
          color: this.iconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.title,
          style: this.selectedIndex == this.selectedValue
              ? Constants.kTitleWhiteTextStyle
              : Constants.kLabelTextStyle,
        ),
      ],
    );
  }
}

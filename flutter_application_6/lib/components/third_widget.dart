import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants.dart';

import 'round_icon_button.dart';

class ThirdWidget extends StatefulWidget {
  final String title;

  int? weight;

  final VoidCallback onPlusPressed;

  final VoidCallback onMinusCallback;

  ThirdWidget({
    required this.title,
    this.weight = Constants.kWeight,
    required this.onPlusPressed,
    required this.onMinusCallback,
  });

  @override
  State<ThirdWidget> createState() => _ThirdWidgetState();
}

class _ThirdWidgetState extends State<ThirdWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.title,
          style: Constants.kLabelTextStyle,
        ),
        Text(
          widget.weight.toString(),
          style: Constants.kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: Icons.remove,
              onPressed:widget.onMinusCallback,
            ),
            SizedBox(
              width: 16.0,
            ),
            RoundIconButton(
              icon: Icons.add,
              onPressed: widget.onPlusPressed,
            ),
          ],
        )
      ],
    );
  }
}

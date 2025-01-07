import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants.dart';

class SecondWidget extends StatefulWidget {
  final String title;

  int heightValue;

  final void Function(double height) onChanged;

  SecondWidget({ required this.title, this.heightValue = 180, required this.onChanged });

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // 1
        Text(
          this.widget.title,
          style: Constants.kLabelTextStyle,
        ),

        SizedBox(
          height: 5.0,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              widget.heightValue.toString(),
              style: Constants.kNumberTextStyle,
            ),

            Text(
              'cm',
              style: Constants.kLabelTextStyle,
            )
          ],
        ),

        SliderTheme(
          data: SliderTheme.of(context).copyWith(

            thumbColor: Constants.kSliderThumbColor,

            activeTrackColor: Constants.kSliderActiveColor,

            inactiveTrackColor: Constants.kSliderInActiveColor,


            overlayColor: Constants.kSliderOverlayColor,

            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 15.0
            ),

            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 30.0,
            ),
          ),
          child: Slider(
            min: Constants.kMinSliderValue,
            max: Constants.kMaxSliderValue,
            value: widget.heightValue.toDouble(),
            // thumbColor: Colors.redAccent,
            // activeColor: Constants.kActiveSliderColor,
            onChanged: widget.onChanged,
          ),
        )
      ],
    );
  }
}

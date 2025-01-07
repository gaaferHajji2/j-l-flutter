import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color tColor;

  final Color? onClickColor;

  final Widget? cardChild;

  final int selectedIndex;

  final int colorValue;

  final VoidCallback? onPress;

  const ReusableCard({
    required this.tColor,
    this.onClickColor,
    this.cardChild = const Center(
      child: Icon(Icons.build_circle_outlined),
    ),
    this.selectedIndex = 0,
    this.colorValue = -1,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: this.onPress,

      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.selectedIndex == this.colorValue
              ? this.onClickColor
              : this.tColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(2.0, 2.0),
              blurRadius: 5.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: this.cardChild,
      ),
    );
  }
}

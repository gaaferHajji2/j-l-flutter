
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;

  final VoidCallback onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  final BoxConstraints normal = const BoxConstraints.tightFor(
    width: 54.0,
    height: 54.0,
  );

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 0.0,
      disabledElevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      onPressed: this.onPressed,
      constraints: normal,
      child: Icon(
        this.icon,
        color: Colors.white,
        size: 35.0,
      ),
    );
  }
}

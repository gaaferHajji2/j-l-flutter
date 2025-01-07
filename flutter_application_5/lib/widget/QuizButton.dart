import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {

  final String btnText;

  final Color btnColor;

  final VoidCallback onPressCallback;

  const QuizButton({
    super.key,
    required this.btnText,
    required this.btnColor,
    required this.onPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        child: Text(btnText),
        style: TextButton.styleFrom(
          backgroundColor: this.btnColor,
          minimumSize: Size(double.infinity, 75.0),
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        onPressed: this.onPressCallback
      ),
    );
  }
}

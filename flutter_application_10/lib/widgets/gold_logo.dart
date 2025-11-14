import 'package:flutter/material.dart';

class EagleLogo extends StatelessWidget {
  const EagleLogo({super.key, this.size = 120});
  final double size;

  @override
  Widget build(BuildContext context) {
    // The eagle + 5 stars are recreated with simple shapes.
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _EaglePainter()),
    );
  }
}

class _EaglePainter extends CustomPainter {
  final Color gold = const Color(0xFFBFA46F);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = gold;

    // Wings
    final wingPath = Path()
      ..moveTo(size.width * 0.1, size.height * 0.45)
      ..quadraticBezierTo(
        size.width * 0.0,
        size.height * 0.35,
        size.width * 0.05,
        size.height * 0.2,
      )
      ..quadraticBezierTo(
        size.width * 0.15,
        size.height * 0.1,
        size.width * 0.25,
        size.height * 0.2,
      )
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.3,
        size.width * 0.4,
        size.height * 0.45,
      )
      ..close()
      ..moveTo(size.width * 0.9, size.height * 0.45)
      ..quadraticBezierTo(
        size.width * 1.0,
        size.height * 0.35,
        size.width * 0.95,
        size.height * 0.2,
      )
      ..quadraticBezierTo(
        size.width * 0.85,
        size.height * 0.1,
        size.width * 0.75,
        size.height * 0.2,
      )
      ..quadraticBezierTo(
        size.width * 0.65,
        size.height * 0.3,
        size.width * 0.6,
        size.height * 0.45,
      )
      ..close();

    // Body
    final bodyPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height * 0.55),
          radius: size.width * 0.12,
        ),
      );

    // Head
    final headPath = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height * 0.35),
          radius: size.width * 0.08,
        ),
      );

    // Stars (5)
    final starRadius = size.width * 0.04;
    final starCenters = [
      Offset(size.width * 0.3, size.height * 0.08),
      Offset(size.width * 0.5, size.height * 0.04),
      Offset(size.width * 0.7, size.height * 0.08),
      Offset(size.width * 0.22, size.height * 0.15),
      Offset(size.width * 0.78, size.height * 0.15),
    ];

    canvas.drawPath(wingPath, paint);
    canvas.drawPath(bodyPath, paint);
    canvas.drawPath(headPath, paint);
    for (var c in starCenters) {
      canvas.drawCircle(c, starRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

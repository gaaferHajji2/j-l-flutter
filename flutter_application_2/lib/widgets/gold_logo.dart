import 'package:flutter/material.dart';

class EagleLogo extends StatelessWidget {
  const EagleLogo({
    super.key,
    this.size = 120,
    this.imageName = "assets/images/logo.png",
  });
  final double size;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    // The eagle + 5 stars are recreated with simple shapes.
    return Image(image: AssetImage(this.imageName!), width: size, height: size);
  }
}

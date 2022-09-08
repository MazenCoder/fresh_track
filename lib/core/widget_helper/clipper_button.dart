import 'package:flutter/material.dart';

class ClipperButton extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width / 3.3, size.height/2);
    Offset endPoint = Offset(size.width / 3.3, size.height-60);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width / 5.5, size.height)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
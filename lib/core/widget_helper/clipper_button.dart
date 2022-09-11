import 'package:flutter/material.dart';
import '../usecases/constants.dart';


class ClipperButton extends CustomClipper<Path> {
  double move = 1;
  ClipperButton(this.move);

  @override
  Path getClip(Size size) {
    logger.v('move: $move');
    Offset controlPoint = Offset(size.width / 3.3 * move, size.height/2);
    Offset endPoint = Offset(size.width / 3.3 * move, size.height-60);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width / 5.5 * move, size.height)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
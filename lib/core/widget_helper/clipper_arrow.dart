import 'package:flutter/material.dart';

enum Edge { right, left}

class ClipperArrow extends CustomClipper<Path> {
  ClipperArrow({
    required this.triangleHeight,
    required this.rectangleClipHeight,
    required this.edge
  });
  /// The height of the triangle part of arrow in the [edge] direction
  final double triangleHeight;

  /// The height of the rectangle part of arrow that is clipped
  final double rectangleClipHeight;

  /// The edge the arrow points
  final Edge edge;

  @override
  Path getClip(Size size) {
    switch (edge) {
      case Edge.right:
        return _getRightPath(size);
      case Edge.left:
        return _getLeftPath(size);
      default:
        return _getRightPath(size);
    }
  }


  Path _getRightPath(Size size) {
    var path = Path();
    path.moveTo(0.0, rectangleClipHeight);
    path.lineTo(size.width - triangleHeight, rectangleClipHeight);
    path.lineTo(size.width - triangleHeight, 0.0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - triangleHeight, size.height);
    path.lineTo(size.width - triangleHeight, size.height - rectangleClipHeight);
    path.lineTo(0.0, size.height - rectangleClipHeight);
    path.close();
    return path;
  }

  Path _getLeftPath(Size size) {
    var path = Path();
    path.moveTo(0.0, size.height / 2);
    path.lineTo(triangleHeight, size.height);
    path.lineTo(triangleHeight, size.height - rectangleClipHeight);
    path.lineTo(size.width, size.height - rectangleClipHeight);
    path.lineTo(size.width, rectangleClipHeight);
    path.lineTo(triangleHeight, rectangleClipHeight);
    path.lineTo(triangleHeight, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    ClipperArrow oldie = oldClipper as ClipperArrow;
    return triangleHeight != oldie.triangleHeight ||
        rectangleClipHeight != oldie.rectangleClipHeight ||
        edge != oldie.edge;
  }
}
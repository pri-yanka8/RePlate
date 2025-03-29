import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFFE9F0FF); // Light Blue Shade

    Path path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.5, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

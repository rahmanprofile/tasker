import 'package:flutter/material.dart';

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()..color = Colors.blueGrey.shade700;
    // ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(200, 200), 400, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
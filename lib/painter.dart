import 'package:flutter/material.dart';
import 'dart:ui';
import 'pendulum.dart';

class PendulumPainter extends CustomPainter {
  late Pendulum p;

  PendulumPainter(this.p);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
        ..color = Colors.blue.shade700
        ..style = PaintingStyle.fill;

    // Drawing pivot point
    canvas.drawCircle(p.pivot, 5, paint);

    // Drawing pendulum rod
    paint.color = Colors.blue;
    canvas.drawLine(p.pivot, p.getBobPos(), paint);

    // Draw bob
    paint.color = Colors.red;
    canvas.drawCircle(p.getBobPos(), 8, paint);

    // Draw trailing points
    Paint trailPaint = Paint()
      ..strokeWidth = 0.5
      ..color = Colors.white;
    canvas.drawPoints(
      PointMode.lines, p.trailPoints, trailPaint
    );
    @override
    bool shouldRepaint(PendulumPainter oldDelegate) => true;
  }

  @override
  bool shouldRepaint(PendulumPainter oldDelegate) => true;
}
import 'package:flutter/material.dart';
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
    canvas.drawCircle(Offset(p.pivotPos.x,p.pivotPos.y), 5, paint);

    // Drawing pendulum rod
    paint.color = Colors.white;
    canvas.drawLine(Offset(p.pivotPos.x,p.pivotPos.y), Offset(p.bobPos.x,p.bobPos.y), paint);

    // Draw bob
    paint.color = Colors.red;
    canvas.drawCircle(Offset(p.bobPos.x,p.bobPos.y), 8, paint);

    @override
    bool shouldRepaint(PendulumPainter oldDelegate) => true;
  }

  @override
  bool shouldRepaint(PendulumPainter oldDelegate) => true;
}
import 'dart:math';

import 'package:vector_math/vector_math_64.dart';

// Dart class to represent a particle in physics simulation

class Pendulum {
  late double length;
  late double angularVel;
  late double angularAcc;
  late Vector2 pivotPos; // Coordinate of pivot point
  late Vector2 bobPos; // Coordinate of Bob
  late double angle;
  late double mass;
  late bool locked;
  late double gravity;

  // Canvas parameters
  /**Color paintcolor = Color(Random().nextInt(0xffffffff));
  late Offset origin;
  List<Offset> trailPoints = [];**/

  Pendulum(double x, double y, double theta) {
    pivotPos = Vector2(x,y);
    length = 2;
    angle = theta;
    bobPos = Vector2(x+60*length*sin(angle*pi/180), y+60*length*cos(angle*pi/180));
    mass = 1;
    gravity = 9.80665;
    angularVel = 0;
    angularAcc = 0;
    locked = false;
  }

  void updatePosition(double x, double y) {
    bobPos = Vector2(x,y);
  }

  void updateLength(double l) {
    length = l;
  }

  void updateGravity(double g) {
    gravity = g;
  }

  void rotate() {
    bobPos = pivotPos + Vector2(60*length*sin(angle*pi/180), 60*length*cos(angle*pi/180));
  }
  void applyForce() {
    if (locked) return;
    angularAcc = -(gravity/length)*sin(angle*pi/180);
    // angularVel *= 0.9; // Damping Coefficient
    angularVel += angularAcc * 0.167;
    angle += angularVel * 0.167;
    rotate();
    angularAcc = 0;
  }
  //Offset get endPoint => Offset((length*sin(angle)), (length*cos(angle)))+origin;

  //@override
  //toString() => 'Pendulum has end point at $endPoint'
}
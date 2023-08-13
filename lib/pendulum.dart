import 'dart:math';

import 'package:vector_math/vector_math_64.dart';
import 'dart:ui';
// Dart class to represent a pendulum in physics simulation

class Pendulum {
  late double length;
  late double angularVel;
  late double angularAcc;
  late Offset pivot;
  late double angle;
  late double mass;
  late bool locked;
  late double gravity;
  List<Offset> trailPoints = [];

  Pendulum(double x, double y, double theta) {
    length = 2;
    angle = theta;
    pivot = Offset(x,y);
    mass = 1;
    gravity = 9.80665;
    angularVel = 0;
    angularAcc = 0;
    locked = false;
  }

  /**void updatePosition(double x, double y) {
    bobPos = Vector2(x,y);
  }**/

  Offset getBobPos() {
    return (pivot + Offset(60*length*sin(angle*pi/180), 60*length*cos(angle*pi/180)));
  }
  void updateLength(double l) {
    length = l;
  }

  void updateGravity(double g) {
    gravity = g;
  }

  /**void rotate() {
    bobPos = pivotPos + Vector2(60*length*sin(angle*pi/180), 60*length*cos(angle*pi/180));
  }**/

  void addTrailPoint() {
    trailPoints.add(getBobPos());
    if (trailPoints.length > 200) {
      trailPoints.removeAt(0);
    }
  }

  void applyForce() {
    if (locked) return;
    angularAcc = -(gravity/length)*sin(angle*pi/180);
    // angularVel *= 0.9; // Damping Coefficient
    angularVel += angularAcc * 0.167;
    angle += angularVel * 0.167;
    angularAcc = 0;
  }
  //Offset get endPoint => Offset((length*sin(angle)), (length*cos(angle)))+origin;

  //@override
  //toString() => 'Pendulum has end point at $endPoint'
}
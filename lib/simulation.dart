import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pendulum/painter.dart';
import 'package:vector_math/vector_math_64.dart' as v;

import 'pendulum.dart';

class SimulationWidget extends StatefulWidget {
  const SimulationWidget({Key? key}) : super(key: key);

  @override
  State<SimulationWidget> createState() => _SimulationWidgetState();
}

class _SimulationWidgetState extends State<SimulationWidget> {
  late Timer timer;
  late Pendulum p;

  @override
  void initState() {
    //setting gravity to 0.1
    setUpPendulum();
    super.initState();
    update();
  }

  //setting up the particles and springs
  void setUpPendulum() {
    p = Pendulum(200, 200, 90);
    //p.locked = true;
  }

  update() {
    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      p.applyForce();
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendulum Simulation'),
      ),
      body: Center(
        child: CustomPaint(
          painter: PendulumPainter(p),
          size: Size(400, 800),
        ),
      ),
    );
  }
}
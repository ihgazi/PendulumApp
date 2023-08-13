import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pendulum/painter.dart';

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
    setUpPendulum();
    super.initState();
    update();
  }

  //setting up the paendulum
  void setUpPendulum() {
    p = Pendulum(50, 50, 90);
    //p.locked = true;
  }

  update() {
    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      p.applyForce();
      p.addTrailPoint();
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
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onDoubleTap: () {
                // Resetting simulation
                setUpPendulum();
                p.locked = true;
              },
              onTap: () {
                // Freezing simulation
                p.locked = !p.locked;
              },
                child: CustomPaint(
                  painter: PendulumPainter(p),
                  size: Size(100, 200),
              )
            ),
            Padding(
              padding: EdgeInsets.only(top:50),
              child: Column (
                children: [
                  // Slider for changind gravity
                  Text("Gravity: ${p.gravity.toStringAsFixed(2)}"),
                  Slider(
                    value: p.gravity,
                    min: 5.0,
                    max: 10.0,
                    onChanged: (value) {
                      setState(() {
                        p.gravity = value;
                      });
                    }
                  ),
                  // Slider for changing length
                  Text("Rope Length: ${p.length.toStringAsFixed(2)}"),
                  Slider(
                    value: p.length,
                    min: 0.5,
                    max: 3.5,
                    onChanged: (value) {
                      setState(() {
                        p.length = value;
                      });
                    }
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}
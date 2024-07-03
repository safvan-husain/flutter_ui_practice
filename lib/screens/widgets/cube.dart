import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Cube extends StatefulWidget {
  const Cube({super.key});

  @override
  State<Cube> createState() => _CubeState();
}

class _CubeState extends State<Cube> with TickerProviderStateMixin {
  late final AnimationController _xController;
  late final AnimationController _yController;
  late final AnimationController _zController;
  late double x = 0;
  late double y = 0;
  double z = 0;
  late Tween<double> _animation;
  @override
  void initState() {
    _xController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _yController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _zController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
    super.initState();
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _xController
    //   ..reset()
    //   ..repeat();

    // _yController
    //   ..reset()
    //   ..repeat();

    // _zController
    //   ..reset()
    //   ..repeat();

    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            x = details.localPosition.dx / 2;
            y = details.localPosition.dy / 2;
          });
          print(details);
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: AnimatedBuilder(
                animation: Listenable.merge([
                  _zController,
                  _xController,
                  _yController,
                ]),
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateX(x)
                      ..rotateY(y)
                      ..rotateZ(z),
                    child: Stack(
                      children: [
                        Transform(
                          alignment: Alignment.topCenter,
                          transform: Matrix4.identity()
                            ..translate(Vector3(0, 0, -100)),
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Transform(
                          // alignment: Alignment.,
                          transform: Matrix4.identity()
                            // ..setEntry(3, 2, 0.001)
                            // ..rotateX(pi + 100)
                            ..rotateY(pi / 2),
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        //center
                        Transform(
                          transform: Matrix4.identity(),
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Transform(
                          alignment: Alignment.topRight,
                          transform: Matrix4.identity()
                            // ..setEntry(3, 2, 0.001)
                            // ..rotateX(pi + 100)
                            ..rotateY(-pi / 2),
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Transform(
                          alignment: Alignment.topCenter,
                          transform: Matrix4.identity()..rotateX(-pi / 2.0),
                          child: Container(
                            color: Colors.orange,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        // bottom side
                        Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()..rotateX(pi / 2.0),
                          child: Container(
                            color: Colors.brown,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

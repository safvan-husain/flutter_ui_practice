import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_sample/data.dart';

class ParallelEffect extends StatefulWidget {
  const ParallelEffect({super.key});

  @override
  State<ParallelEffect> createState() => _ParallelEffectState();
}

class _ParallelEffectState extends State<ParallelEffect> {
  double angle = 0.0;
  Offset _offset = Offset.zero;
  double? prePosition;
  double x = 0;
  double y = 0;
  double z = 0;
  int imageIndex = 0;

  @override
  void initState() {
    super.initState();

    // printBouncingNumbers(0, 3.1);
  }

  void animate(double start, double end, Duration duration,
      {isReverse = false}) {
    // double y = start;
    double delta = end - start;
    bool isImageChanged = false;

    // Cubic easing out function
    double easeOutCubic(double t) {
      return 1 - pow(1 - t, 3) as double;
    }

    int milliseconds = duration.inMilliseconds;
    for (int i = 0; i < milliseconds; i++) {
      // Calculate the normalized time (between 0 and 1)
      double t = i / milliseconds;

      // Apply the easing function
      double easedT = easeOutCubic(t);

      // Calculate the new value based on the eased time
      double newValue = start + (delta * easedT);

      // Use a timer to simulate the delay in each iteration
      Timer(Duration(milliseconds: i), () {
        setState(() {
          // print("updating y");

          y = isReverse ? (end - newValue) : (start + newValue);
          if (isImageChanged == false && y > 1.5) {
            print("called");
            isImageChanged = true;
            if (isReverse) {
              if (imageIndex < 2) {
                imageIndex++;
              } else {
                imageIndex = 0;
              }
            } else {
              if (imageIndex == 0) {
                imageIndex = 2;
              } else {
                imageIndex--;
              }
            }
            // if (imageIndex < 2 && imageIndex > 0) {
            //   isReverse ? imageIndex++ : imageIndex--;
            // } else {
            //   if (imageIndex == 0) {
            //     imageIndex = 2;
            //   }
            //   imageIndex = 0;
            // }
          }
        });
      });
    }
  }

  Offset _start = Offset.zero;
  Offset _end = Offset.zero;

  void _determineSwipeDirection() {
    if (_start.dx < _end.dx) {
      animate(0, 3.12, Duration(milliseconds: 500), isReverse: true);
    } else if (_start.dx > _end.dx) {
      animate(0, 3.12, Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            GestureDetector(
              onHorizontalDragStart: (details) {
                _start = details.localPosition;
              },
              onHorizontalDragUpdate: (details) {
                _end = details.localPosition;
              },
              onHorizontalDragEnd: (details) {
                _determineSwipeDirection();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                // color: Colors.amber,
                width: double.infinity,
                // height: double.infinity,
                height: 500,
                child:
                    // PageView.builder(
                    //   itemCount: images.length,
                    //   controller: pageController,
                    //   itemBuilder: (context, index) {
                    //     return
                    Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(x)
                    ..rotateY(y)
                    ..rotateZ(z),
                  alignment: FractionalOffset.center,
                  // child: Container(
                  //   color: Colors.red,
                  //   height: 200.0,
                  //   width: 200.0,
                  // ),
                  // origin: _offset,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     border: Border.all(
                    //       color: Colors.black,
                    //     )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        images[imageIndex].path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //   );
                  // },
                  // itemBuilder: (context, index) => Container(
                  //   width: 200,
                  //   height: 200,
                  //   child: Image.asset(images[index].path),
                  // ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  print(x);
                  print(y);
                  setState(() {
                    angle = 1;
                    x = 0;
                    if (y != 0) {
                      y = 0;
                    } else {
                      y = 3.1;
                    }
                  });
                },
                child: Text("reset"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

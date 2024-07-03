import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FlipperCard extends StatefulWidget {
  final Duration duration;
  Widget Function(int index) child;
  final int length;
  FlipperCard({
    super.key,
    required this.length,
    required this.duration,
    required this.child,
  });

  @override
  State<FlipperCard> createState() => _FlipperCardState();
}

class _FlipperCardState extends State<FlipperCard> {
  double angle = 0.0;
  double? prePosition;
  double x = 0;
  double y = 0;
  double z = 0;
  int imageIndex = 0;

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
          if (isImageChanged == false && y > 2) {
            isImageChanged = true;
            if (isReverse) {
              if (imageIndex == 0) {
                imageIndex = 2;
              } else {
                imageIndex--;
              }
            } else {
              if (imageIndex < 2) {
                imageIndex++;
              } else {
                imageIndex = 0;
              }
            }
          }
        });
      });
    }
    if (isReverse == false) {
      animate(0, 3.25, Duration.zero);
    }
  }

  Offset? _start;
  Offset? _end;

  void _determineSwipeDirection() {
    if (_start == null || _end == null) {
      return;
    }
    double distance = (_start!.dx - _end!.dx).abs();
    if (distance > 20) {
      if (_start!.dx < _end!.dx) {
        animate(0, 3.25, widget.duration, isReverse: true);
      } else if (_start!.dx > _end!.dx) {
        animate(0, 3.25, widget.duration);
      }
    }

    _start = null;
    _end = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        _start = details.localPosition;
      },
      onHorizontalDragUpdate: (details) {
        _end = details.localPosition;
      },
      onHorizontalDragEnd: (details) {
        _determineSwipeDirection();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 650,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(y)
                  ..rotateX(x)
                  ..rotateZ(z),
                alignment: FractionalOffset.center,
                child: widget.child(imageIndex),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  widget.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 5),
                          height: 5,
                          width: imageIndex == index ? 20 : 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

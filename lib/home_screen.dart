import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_sample/screens/parallel_effect_screen.dart';
import 'package:ui_sample/screens/widgets/room_preview_card.dart';

enum SideCircle {
  left,
  right,
}

extension ToPath on SideCircle {
  Path toPath(Size size) {
    final path = Path();

    late Offset _offset;
    late bool isClockwise;

    switch (this) {
      case SideCircle.right:
        _offset = Offset(0, size.height);
        isClockwise = true;
        break;
      case SideCircle.left:
        path.moveTo(size.width, 0);
        _offset = Offset(size.width, size.height);
        isClockwise = false;
        break;
    }
    path.arcToPoint(
      _offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: isClockwise,
    );
    path.close();
    return path;
  }
}

class HalfCircleClip implements CustomClipper<Path> {
  final SideCircle side;
  const HalfCircleClip({required this.side});
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Rect getApproximateClipRect(Size size) {
    // TODO: implement getApproximateClipRect
    throw UnimplementedError();
  }

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _first_controller;
  late Animation<double> _first_animation;

  late AnimationController _second_controller;
  late Animation<double> _second_animation;
  @override
  void initState() {
    super.initState();
    _first_controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _first_animation =
        Tween<double>(begin: 0.0, end: -(pi / 2)).animate(_first_controller);
    _second_controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _second_animation =
        Tween<double>(begin: 0.0, end: pi).animate(_second_controller);
    _first_controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _second_controller.forward(from: 0);
      }
    });
    _second_controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _first_controller.forward(from: 0.0);
      }
    });
    _second_controller.forward();
  }

  @override
  void dispose() {
    _first_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: AnimatedBuilder(
                animation: _first_controller,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateZ(_first_animation.value),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedBuilder(
                            animation: _second_controller,
                            builder: (context, child) {
                              return Transform(
                                alignment: Alignment.centerRight,
                                transform: Matrix4.identity()
                                  ..rotateY(_second_animation.value),
                                child: ClipPath(
                                  clipper: const HalfCircleClip(
                                      side: SideCircle.left),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 100,
                                    decoration: const BoxDecoration(
                                      // borderRadius: BorderRadius.only(
                                      //     topLeft: Radius.circular(100),
                                      //     topRight: Radius.circular(100)),
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: _second_controller,
                            builder: (context, child) {
                              return Transform(
                                alignment: Alignment.centerLeft,
                                transform: Matrix4.identity()
                                  ..rotateY(_second_animation.value),
                                child: ClipPath(
                                  clipper: const HalfCircleClip(
                                      side: SideCircle.right),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 100,
                                    width: 100,
                                    decoration: const BoxDecoration(
                                      // borderRadius: BorderRadius.only(
                                      //     topLeft: Radius.circular(100),
                                      //     topRight: Radius.circular(100)),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      // body: FlipperCard(
      //   length: 3,
      //   duration: const Duration(milliseconds: 500),
      //   child: (index) {
      //     return const RoomPreviewCard();
      //   },
      // ),
    );
  }
}

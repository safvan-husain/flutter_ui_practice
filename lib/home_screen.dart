import 'package:flutter/material.dart';
import 'package:ui_sample/screens/parallel_effect_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (co) => ParallelEffect()));
            },
            child: Text("Hey"),
          ),
        ],
      ),
    );
  }
}

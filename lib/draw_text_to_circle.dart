import 'package:flutter/material.dart';

import 'text_to_circle_painter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        child: CustomPaint(
          size: size,
          painter: DrawTextToCirclePainter(),
        ),
      ),
    );
  }
}

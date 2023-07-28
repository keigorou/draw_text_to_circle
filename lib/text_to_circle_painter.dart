import 'dart:math';

import 'package:flutter/material.dart';

class DrawTextToCirclePainter extends CustomPainter {
  final String text;

  DrawTextToCirclePainter(
      {this.text = 'Hello World!! '});

  late final _angleList = _layoutPosition(text.split('').length);

  late final textStyle = const TextStyle(
    fontSize: 36,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final textList = text.split('').toList();

    const origin = Offset.zero;
    final center = size.center(origin);
    final radius = size.width / 2;

    canvas.save();

    for (var i = 0; i < textList.length; i++) {
      final textPainter = TextSpan(
        text: textList[i],
        style: textStyle,
      ).toPainter()
        ..layout();

      final layoutOffset = Offset.fromDirection(
          _angleList[i].toRadians(), radius);
      final offset = center + layoutOffset;
      canvas.restore();
      canvas.save();

      canvas.translate(offset.dx, offset.dy);
      canvas.rotate((_angleList[i] + 90).toRadians());
      canvas.translate(-offset.dx, -offset.dy);

      textPainter.paint(
          canvas, Offset(offset.dx - (textPainter.width / 2), offset.dy));
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<double> _layoutPosition(int textLength) {
    final angle = 360 / textLength;
    return List.generate(textLength, (index) => index * angle - 180);
  }


}

extension on num {
  double toRadians() => this * pi / 180;
}

extension on TextSpan {
  TextPainter toPainter({TextDirection textDirection = TextDirection.ltr}) =>
      TextPainter(text: this, textDirection: textDirection);
}

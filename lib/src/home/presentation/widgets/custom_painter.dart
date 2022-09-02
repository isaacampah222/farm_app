import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  double value;
  bool isTemp;
  double maxValue;
  Color color;

  CircleProgress(this.value, this.isTemp, this.maxValue, this.color);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = 14
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Paint tempArc = Paint()
      ..strokeWidth = 14
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint humidityArc = Paint()
      ..strokeWidth = 14
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 14;
    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (value / maxValue);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, isTemp ? tempArc : humidityArc);
  }
}

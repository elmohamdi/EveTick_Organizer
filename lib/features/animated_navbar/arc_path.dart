import 'dart:ui';

import 'package:flutter/material.dart';
class ArcPath {
  const ArcPath._();

  static Offset calculate({
    required double progress,
    required double startX,
    required double endX,
    double arcHeight = -35,
  }) {
    final path = Path()
      ..moveTo(startX, 0)
      ..quadraticBezierTo(
        (startX + endX) / 2,
        arcHeight,
        endX,
        0,
      );

    final metric = path.computeMetrics().first;
    final tangent = metric.getTangentForOffset(metric.length * progress);

    return tangent!.position;
  }
}
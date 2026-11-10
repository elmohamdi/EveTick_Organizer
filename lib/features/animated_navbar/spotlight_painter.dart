import 'dart:ui';

import 'package:flutter/material.dart';


class SpotlightPainter extends CustomPainter {
  final double centerX;
  final Color color;

  const SpotlightPainter({required this.centerX, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    
    final path = Path()
      ..moveTo(centerX - 25, 0)
      ..lineTo(centerX + 25, 0)
      ..lineTo(centerX + 46, size.height)
      ..lineTo(centerX - 46, size.height)
      ..close();

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withValues(alpha: 0.55),
          color.withValues(alpha: 0.20),
          color.withValues(alpha: 0.10),
        ],
      ).createShader(Rect.fromLTWH(centerX - 60, 0, 120, size.height));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant SpotlightPainter oldDelegate) {
    return oldDelegate.centerX != centerX || oldDelegate.color != color;
  }
}

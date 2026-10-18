import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicator extends StatelessWidget {
  final double progress;
  final double startX;
  final double endX;
  final Color color;

  const Indicator({
    super.key,
    required this.progress,
    required this.startX,
    required this.endX,
    required this.color,
  });

  static final double _width = 51.w;
  static const double _height = 6;
  static const double _topOffset = 0;

  @override
  Widget build(BuildContext context) {
    final currentX = lerpDouble(startX, endX, progress)!;

    return Positioned(
      left: currentX - _width / 2,
      top: _topOffset,
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.7),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
            BoxShadow(
              color: color.withValues(alpha: 0.4),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}

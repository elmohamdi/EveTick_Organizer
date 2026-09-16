import 'package:evetick_organizer/features/animated_navbar/arc_path.dart';
import 'package:evetick_organizer/features/animated_navbar/spotlight_painter.dart';
import 'package:flutter/material.dart';

class Spotlight extends StatelessWidget {
  final double progress;
  final double startX;
  final double endX;
  final Color color;

  const Spotlight({
    super.key,
    required this.progress,
    required this.startX,
    required this.endX,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final offset = ArcPath.calculate(
      progress: progress,
      startX: startX,
      endX: endX,
    );

    return IgnorePointer(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: SpotlightPainter(centerX: offset.dx, color: color),
        ),
      ),
    );
  }
}

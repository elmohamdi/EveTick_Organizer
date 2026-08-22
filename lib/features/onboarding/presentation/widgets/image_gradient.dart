import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ImageGradient extends StatelessWidget {
  const ImageGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.11, 0.5, 0.84],
            colors: [
            context.colors.lightBlue.withValues(alpha: 0.97),
            context.colors.lightBlue.withValues(alpha: 0.5),
            context.colors.lightBlue.withValues(alpha: 0.97),
            ],
          ),
        ),
      ),
    );
  }
}

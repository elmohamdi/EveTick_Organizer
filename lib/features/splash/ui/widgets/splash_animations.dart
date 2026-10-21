import 'package:flutter/material.dart';

class SplashAnimations {
  static const Duration totalDuration = Duration(milliseconds: 3600);

  final AnimationController controller;

  late final Animation<double> fadeIn;
  late final Animation<double> popScale;
  late final Animation<double> entryTilt;

  late final Animation<double> wiggle;

  late final Animation<double> lift;
  late final Animation<double> nameFade;
  late final Animation<double> nameSlide;

  SplashAnimations(this.controller) {
    fadeIn = _tween(0, 1, 0.08, 0.28, Curves.easeOut);
    popScale = _tween(0.55, 1, 0.08, 0.36, Curves.easeOutBack);
    entryTilt = _tween(-0.18, 0, 0.08, 0.36, Curves.easeOutCubic);

    wiggle = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.10, end: -0.08), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -0.08, end: 0.0), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.38, 0.60, curve: Curves.easeInOut),
      ),
    );

    lift = _tween(0, 1, 0.58, 0.82, Curves.easeInOutCubic);
    nameFade = _tween(0, 1, 0.66, 0.88, Curves.easeOut);
    nameSlide = _tween(12, 0, 0.66, 0.88, Curves.easeOutCubic);
  }

  Animation<double> _tween(
    double from,
    double to,
    double begin,
    double end,
    Curve curve,
  ) {
    return Tween<double>(begin: from, end: to).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(begin, end, curve: curve),
      ),
    );
  }
}

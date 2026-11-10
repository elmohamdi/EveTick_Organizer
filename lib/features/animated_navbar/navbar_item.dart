import 'package:flutter/material.dart';

class AnimatedNavbarItem {
  final Widget icon;
  final Widget? activeIcon;
  
  const AnimatedNavbarItem({
    required this.icon,
    this.activeIcon,
  });
}
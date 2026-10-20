import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// The kind of message an `AppToast` shows. It decides the icon and the accent.
enum AppToastType {
  success(Icons.check_circle_rounded, ColorsManager.confirmed),
  error(Icons.error_rounded, ColorsManager.red),
  info(Icons.info_rounded, ColorsManager.orange);

  const AppToastType(this.icon, this.color);

  final IconData icon;
  final Color color;
}

import 'package:evetick_organizer/core/widgets/app_toast/app_toast_card.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast_type.dart';
import 'package:flutter/material.dart';

/// A nicer replacement for `ScaffoldMessenger.showSnackBar`.
///
/// ```dart
/// AppToast.success(context, 'Invitation sent');
/// AppToast.error(context, 'Something went wrong');
/// AppToast.info(context, 'Please upload a cover image');
/// ```
///
/// It is drawn on the root overlay, so it stays on screen when the current
/// screen or bottom sheet is popped right after showing it, and it needs no
/// Scaffold. Only one toast is visible at a time: a new one replaces the old.
abstract final class AppToast {
  static OverlayEntry? _current;

  static void success(BuildContext context, String message) =>
      show(context, message: message, type: AppToastType.success);

  static void error(BuildContext context, String message) =>
      show(context, message: message, type: AppToastType.error);

  static void info(BuildContext context, String message) =>
      show(context, message: message, type: AppToastType.info);

  static void show(
    BuildContext context, {
    required String message,
    AppToastType type = AppToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;
    showOn(overlay, message: message, type: type, duration: duration);
  }

  /// Same as [show] for code that has to grab the overlay before an `await`
  /// (when the widget may be gone by the time the message is ready):
  /// `final overlay = Overlay.of(context, rootOverlay: true);`
  static void showOn(
    OverlayState overlay, {
    required String message,
    AppToastType type = AppToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (!overlay.mounted || message.trim().isEmpty) return;

    _dismissCurrent();

    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => AppToastCard(
        message: message,
        type: type,
        duration: duration,
        onClosed: () {
          if (entry.mounted) entry.remove();
          if (identical(_current, entry)) _current = null;
        },
      ),
    );
    _current = entry;
    overlay.insert(entry);
  }

  static void _dismissCurrent() {
    final entry = _current;
    _current = null;
    if (entry != null && entry.mounted) entry.remove();
  }
}

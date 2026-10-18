import 'package:flutter/services.dart';

/// Sound / haptic feedback played after every scan result.
///
/// Uses only Flutter's built-in services (no extra package). If you want a
/// real beep, replace [playSound] with an audio package + asset.
class ScanFeedbackService {
  const ScanFeedbackService();

  Future<void> playSound() => SystemSound.play(SystemSoundType.click);

  Future<void> vibrate() => HapticFeedback.heavyImpact();
}

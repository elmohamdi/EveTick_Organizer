import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_toggle_card.dart';
import 'package:flutter/material.dart';

class ScanQuickSettings extends StatelessWidget {
  final bool soundEnabled;
  final ValueChanged<bool> onSoundChanged;
  final bool vibrateEnabled;
  final ValueChanged<bool> onVibrateChanged;

  const ScanQuickSettings({
    super.key,
    required this.soundEnabled,
    required this.onSoundChanged,
    required this.vibrateEnabled,
    required this.onVibrateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ScanToggleCard(
            icon: Icons.volume_up_rounded,
            title: 'Sound',
            isEnabled: soundEnabled,
            onChanged: onSoundChanged,
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: ScanToggleCard(
            icon: Icons.vibration_rounded,
            title: 'Vibrate',
            isEnabled: vibrateEnabled,
            onChanged: onVibrateChanged,
          ),
        ),
      ],
    );
  }
}

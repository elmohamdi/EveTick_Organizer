import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/features/ticket_scan/logic/cubit/ticket_scan_cubit.dart';
import 'package:evetick_organizer/features/ticket_scan/presentation/widgets/scan_toggle_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanQuickSettings extends StatelessWidget {
  const ScanQuickSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final soundEnabled = context.select(
      (TicketScanCubit cubit) => cubit.state.soundEnabled,
    );
    final vibrateEnabled = context.select(
      (TicketScanCubit cubit) => cubit.state.vibrateEnabled,
    );
    final cubit = context.read<TicketScanCubit>();

    return Row(
      children: [
        Expanded(
          child: ScanToggleCard(
            icon: Icons.volume_up_rounded,
            title: 'Sound',
            isEnabled: soundEnabled,
            onChanged: cubit.setSoundEnabled,
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: ScanToggleCard(
            icon: Icons.vibration_rounded,
            title: 'Vibrate',
            isEnabled: vibrateEnabled,
            onChanged: cubit.setVibrateEnabled,
          ),
        ),
      ],
    );
  }
}

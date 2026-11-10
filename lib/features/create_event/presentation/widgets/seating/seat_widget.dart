import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/create_event/data/models/seat_status.dart';
import 'package:flutter/material.dart';

/// One tappable seat cell inside the [SeatGridPreview]. Purely visual -
/// tapping just reports up through [onTap], the parent owns the status.
///
/// [seatSize] is the computed dimension (width & height) for this seat,
/// calculated by the parent based on available width and the number of
/// seats in the row. [margin] scales proportionally with [seatSize].
class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.status,
    required this.onTap,
    this.seatSize = 28,
  });

  final SeatStatus status;
  final VoidCallback onTap;
  final double seatSize;

  Color _colorFor(BuildContext context) {
    switch (status) {
      case SeatStatus.available:
        return ColorsManager.chairColor;
      case SeatStatus.unavailable:
        return context.colors.lightBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scale margin proportionally: ~10% of the seat size, clamped.
    final double margin = (seatSize * 0.1).clamp(1.5, 3.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: seatSize,
        height: seatSize,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: _colorFor(context),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular((seatSize * 0.28).clamp(3.0, 8.0)),
            topRight: Radius.circular((seatSize * 0.28).clamp(3.0, 8.0)),
            bottomLeft: Radius.circular((seatSize * 0.1).clamp(2.0, 3.0)),
            bottomRight: Radius.circular((seatSize * 0.1).clamp(2.0, 3.0)),
          ),
        ),
      ),
    );
  }
}

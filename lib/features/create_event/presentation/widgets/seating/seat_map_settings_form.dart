import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/number_stepper_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Rows / seats-per-row controls for a [VenueLayoutType.seating] layout.
/// Purely presentational - [BuildSeatingDetails] owns the actual numbers
/// and regenerates the seat map whenever they change.
class SeatMapSettingsForm extends StatelessWidget {
  const SeatMapSettingsForm({
    super.key,
    required this.rows,
    required this.seatsPerRow,
    required this.onRowsChanged,
    required this.onSeatsPerRowChanged,
  });

  final int rows;
  final int seatsPerRow;
  final ValueChanged<int> onRowsChanged;
  final ValueChanged<int> onSeatsPerRowChanged;

  static const int _minRows = 1;
  static const int _maxRows = 26; // A..Z row labels
  static const int _minSeatsPerRow = 1;
  static const int _maxSeatsPerRow = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.fourthBlue,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Map Settings', style: TextStyles.font16WhiteBold(context)),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: NumberStepperField(
                  label: 'Rows',
                  value: rows,
                  min: _minRows,
                  max: _maxRows,
                  onChanged: onRowsChanged,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: NumberStepperField(
                  label: 'Seats per Row',
                  value: seatsPerRow,
                  min: _minSeatsPerRow,
                  max: _maxSeatsPerRow,
                  onChanged: onSeatsPerRowChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

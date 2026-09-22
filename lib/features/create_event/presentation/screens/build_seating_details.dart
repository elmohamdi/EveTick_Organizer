import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/filled_app_text_button.dart';
import 'package:evetick_organizer/features/create_event/data/models/seat_status.dart';
import 'package:evetick_organizer/features/create_event/data/models/seating_config_model.dart';
import 'package:evetick_organizer/features/create_event/data/models/venue_layout_type.dart';
import 'package:evetick_organizer/features/create_event/data/models/venue_section_model.dart';
import 'package:evetick_organizer/features/create_event/logic/cubit/create_event_cubit.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/layout_type_selector.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/seat_grid_preview.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/seat_map_legend.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/seat_map_settings_form.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/sections_editor.dart';
import 'package:evetick_organizer/features/create_event/presentation/widgets/seating/venue_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Step shown right before "Ticket Tiers": the organizer builds the venue
/// map here, either a seat grid ([VenueLayoutType.seating]) or a list of
/// named zones ([VenueLayoutType.sections]).
///
/// This widget only owns the *editing* state (current rows/seatsPerRow,
/// the live seat grid, the section controllers). Once the organizer hits
/// "Continue", that state is converted into a [SeatingConfigModel] and
/// pushed to [CreateEventCubit] - the rest of the flow never needs to know
/// how the map was built.
class BuildSeatingDetails extends StatefulWidget {
  const BuildSeatingDetails({super.key, this.onNextStep});

  final VoidCallback? onNextStep;

  @override
  State<BuildSeatingDetails> createState() => _BuildSeatingDetailsState();
}

class _BuildSeatingDetailsState extends State<BuildSeatingDetails> {
  final _formKey = GlobalKey<FormState>();

  VenueLayoutType _layoutType = VenueLayoutType.seating;

  // --- Seating layout state ---
  int _rows = 8;
  int _seatsPerRow = 12;
  late List<List<SeatStatus>> _seatMap = _buildSeatMap(_rows, _seatsPerRow);

  // --- Sections layout state ---
  final List<VenueSection> _sections = [VenueSection()];

  List<List<SeatStatus>> _buildSeatMap(int rows, int seatsPerRow) {
    return List.generate(
      rows,
      (_) => List.generate(seatsPerRow, (_) => SeatStatus.available),
    );
  }

  /// Resizes [_seatMap] to the new dimensions, keeping the status of every
  /// seat that still exists at its old (row, seat) position instead of
  /// resetting the whole map back to "available".
  void _resizeSeatMap(int newRows, int newSeatsPerRow) {
    final resized = List.generate(newRows, (r) {
      return List.generate(newSeatsPerRow, (s) {
        final bool existedBefore = r < _seatMap.length && s < _seatMap[r].length;
        return existedBefore ? _seatMap[r][s] : SeatStatus.available;
      });
    });

    setState(() {
      _rows = newRows;
      _seatsPerRow = newSeatsPerRow;
      _seatMap = resized;
    });
  }

  void _toggleSeat(int rowIndex, int seatIndex) {
    setState(() {
      final current = _seatMap[rowIndex][seatIndex];
      _seatMap[rowIndex][seatIndex] = current.toggled;
    });
  }

  void _addSection() {
    setState(() => _sections.add(VenueSection()));
  }

  void _removeSection(int index) {
    setState(() => _sections.removeAt(index).dispose());
  }

  SeatingConfigModel _buildSeatingConfig() {
    if (_layoutType.isSeating) {
      return SeatingConfigModel(
        layoutType: VenueLayoutType.seating,
        rows: _rows,
        seatsPerRow: _seatsPerRow,
        seatMap: _seatMap,
      );
    }

    final sectionModels = _sections
        .map(
          (section) => VenueSectionModel(
            sectionName: section.nameController.text.trim(),
            capacity: int.parse(section.capacityController.text),
          ),
        )
        .toList();

    return SeatingConfigModel(
      layoutType: VenueLayoutType.sections,
      sections: sectionModels,
    );
  }

  void _onContinuePressed() {
    if (_layoutType.isSections) {
      final bool isValid = _formKey.currentState?.validate() ?? false;
      if (!isValid) return;
    }

    context.read<CreateEventCubit>().updateSeatingConfig(_buildSeatingConfig());
    widget.onNextStep?.call();
  }

  @override
  void dispose() {
    for (final section in _sections) {
      section.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Venue Map', style: TextStyles.font24OrangeBold),
            verticalSpace(4),
            Text(
              'Choose how attendees will be seated at this event.',
              style: TextStyles.font14LightGrayRegular(context),
            ),

            verticalSpace(16),

            LayoutTypeSelector(
              selectedType: _layoutType,
              onChanged: (type) => setState(() => _layoutType = type),
            ),

            verticalSpace(16),

            if (_layoutType.isSeating) ...[
              SeatMapSettingsForm(
                rows: _rows,
                seatsPerRow: _seatsPerRow,
                onRowsChanged: (value) => _resizeSeatMap(value, _seatsPerRow),
                onSeatsPerRowChanged: (value) => _resizeSeatMap(_rows, value),
              ),
              verticalSpace(16),
              SeatGridPreview(seatMap: _seatMap, onSeatTap: _toggleSeat),
              verticalSpace(12),
              const SeatMapLegend(),
            ] else
              SectionsEditor(
                sections: _sections,
                onAddSection: _addSection,
                onRemoveSection: _removeSection,
              ),

            verticalSpace(32),

            FilledAppTextButton(
              buttonText: 'Continue to Tickets',
              onPressed: _onContinuePressed,
            ),

            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}

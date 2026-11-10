import 'package:evetick_organizer/features/create_event/data/models/seat_status.dart';
import 'package:evetick_organizer/features/create_event/data/models/venue_layout_type.dart';
import 'package:evetick_organizer/features/create_event/data/models/venue_section_model.dart';

/// The venue map an organizer builds for an event, either a seat grid
/// ([VenueLayoutType.seating]) or a list of named zones
/// ([VenueLayoutType.sections]).
class SeatingConfigModel {
  final VenueLayoutType layoutType;

  // Seating layout fields.
  final int rows;
  final int seatsPerRow;
  final List<List<SeatStatus>> seatMap;

  // Sections layout fields.
  final List<VenueSectionModel> sections;

  const SeatingConfigModel({
    required this.layoutType,
    this.rows = 0,
    this.seatsPerRow = 0,
    this.seatMap = const [],
    this.sections = const [],
  });

  int get totalSeats => rows * seatsPerRow;

  int get availableSeatsCount => seatMap
      .expand((row) => row)
      .where((seat) => seat == SeatStatus.available)
      .length;

  Map<String, dynamic> toJson() {
    return {
      'layoutType': layoutType.name,
      'rows': rows,
      'seatsPerRow': seatsPerRow,
      // Firestore does not support nested arrays (array-of-array), so each
      // row is stored as a map containing a single 'seats' array instead of
      // a raw List<String> nested directly inside the outer 'seatMap' list.
      'seatMap': seatMap.asMap().entries.map((entry) {
        return {
          'row': entry.key,
          'seats': entry.value.map((seat) => seat.name).toList(),
        };
      }).toList(),
      'sections': sections.map((section) => section.toJson()).toList(),
    };
  }
}

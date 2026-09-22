/// The kind of venue layout an organizer can build for an event.
///
/// [seating] is a row/column grid of individual chairs (cinema, theatre,
/// concert hall style seating).
/// [sections] is a set of named zones with a capacity each (general
/// admission areas, standing sections, "Stage A / Stage B" style zones)
/// with no individual seats.
enum VenueLayoutType {
  seating,
  sections;

  bool get isSeating => this == VenueLayoutType.seating;
  bool get isSections => this == VenueLayoutType.sections;
}

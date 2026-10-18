/// The state of a single seat cell inside a [SeatingConfigModel] seat map.
///
/// [available] seats are sellable chairs.
/// [unavailable] marks a cell the organizer removed from sale (an aisle,
/// a pillar, a gap in the layout, etc.) while keeping its place in the grid.
enum SeatStatus {
  available,
  unavailable;

  SeatStatus get toggled =>
      this == SeatStatus.available ? SeatStatus.unavailable : SeatStatus.available;
}

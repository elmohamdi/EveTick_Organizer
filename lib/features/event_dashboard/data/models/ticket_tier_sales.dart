class TicketTierSales {
  const TicketTierSales({
    required this.name,
    required this.price,
    required this.capacity,
    required this.sold,
  });

  final String name;
  final double price;

  /// `ticketQuantity` of the tier.
  final int capacity;
  final int sold;

  double get revenue => sold * price;

  double get soldRatio =>
      capacity <= 0 ? 0 : (sold / capacity).clamp(0.0, 1.0).toDouble();
}

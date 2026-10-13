class ScanEvent {
  const ScanEvent({
    required this.id,
    required this.title,
    required this.totalExpected,
    required this.isLive,
  });

  final String id;
  final String title;

  /// Sum of `ticketQuantity` over all ticket tiers of the event.
  final int totalExpected;
  final bool isLive;
}

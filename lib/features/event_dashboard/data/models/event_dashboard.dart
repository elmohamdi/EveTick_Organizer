import 'package:evetick_organizer/features/event_dashboard/data/models/ticket_tier_sales.dart';

class EventDashboard {
  const EventDashboard({
    required this.eventId,
    required this.title,
    required this.status,
    required this.isOnline,
    required this.location,
    required this.tiers,
    required this.checkedIn,
    this.isOrganizer = true,
    this.coverImageUrl,
    this.category,
    this.startAt,
    this.endAt,
  });

  final String eventId;
  final String title;
  final String status;
  final bool isOnline;
  final String location;
  final String? coverImageUrl;
  final String? category;
  final DateTime? startAt;
  final DateTime? endAt;
  final List<TicketTierSales> tiers;
  final int checkedIn;

  /// `false` when the viewer is staff with the "view analytics" permission.
  final bool isOrganizer;

  int get capacity => tiers.fold(0, (sum, tier) => sum + tier.capacity);

  int get ticketsSold => tiers.fold(0, (sum, tier) => sum + tier.sold);

  double get revenue => tiers.fold(0.0, (sum, tier) => sum + tier.revenue);

  double get sellThrough =>
      capacity <= 0 ? 0 : (ticketsSold / capacity).clamp(0.0, 1.0).toDouble();
}

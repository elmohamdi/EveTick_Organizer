import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';

/// Numbers aggregated across every event the organizer created.
class HomeOverview {
  const HomeOverview({required this.events});

  final List<EventDashboard> events;

  bool get isEmpty => events.isEmpty;

  int get totalEvents => events.length;

  int get liveEvents =>
      events.where((event) => event.status.toLowerCase() == 'live').length;

  int get capacity => events.fold(0, (sum, event) => sum + event.capacity);

  int get ticketsSold =>
      events.fold(0, (sum, event) => sum + event.ticketsSold);

  int get checkedIn => events.fold(0, (sum, event) => sum + event.checkedIn);

  double get revenue => events.fold(0.0, (sum, event) => sum + event.revenue);

  double get sellThrough =>
      capacity <= 0 ? 0 : (ticketsSold / capacity).clamp(0.0, 1.0).toDouble();
}

import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';

abstract class EventDashboardRepository {
  Future<Result<EventDashboard>> getDashboard(String eventId);

  /// Emits whenever a sale changes the event's numbers (the first event is the
  /// current state). Lets the dashboard reload itself live. Errors are
  /// delivered through the stream and are not fatal: the dashboard still works
  /// with pull-to-refresh.
  Stream<void> watchSalesChanges(String eventId);
}

import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';

abstract class EventDashboardRepository {
  Future<Result<EventDashboard>> getDashboard(String eventId);
}

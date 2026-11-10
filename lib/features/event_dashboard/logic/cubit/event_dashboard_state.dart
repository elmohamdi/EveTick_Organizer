import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';

abstract class EventDashboardState {}

class EventDashboardInitial extends EventDashboardState {}

class EventDashboardLoading extends EventDashboardState {}

class EventDashboardSuccess extends EventDashboardState {
  final EventDashboard dashboard;
  EventDashboardSuccess(this.dashboard);
}

class EventDashboardFailure extends EventDashboardState {
  final String error;
  EventDashboardFailure(this.error);
}

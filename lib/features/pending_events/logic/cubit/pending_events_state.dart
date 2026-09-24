abstract class PendingEventsState {}

class PendingEventsInitial extends PendingEventsState {}

class PendingEventsLoading extends PendingEventsState {}

class PendingEventsSuccess extends PendingEventsState {
  final List<Map<String, dynamic>> events;
  PendingEventsSuccess(this.events);
}

class PendingEventsFailure extends PendingEventsState {
  final String error;
  PendingEventsFailure(this.error);
}

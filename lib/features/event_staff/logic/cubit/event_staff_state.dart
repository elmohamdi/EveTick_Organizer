import 'package:evetick_organizer/features/event_staff/data/models/event_staff_member.dart';

enum StaffLoadStatus { initial, loading, success, failure }

class EventStaffState {
  const EventStaffState({
    this.status = StaffLoadStatus.initial,
    this.members = const [],
    this.errorMessage,
    this.isInviting = false,
    this.removingIds = const {},
  });

  final StaffLoadStatus status;
  final List<EventStaffMember> members;
  final String? errorMessage;
  final bool isInviting;

  /// Ids of members whose removal is in flight.
  final Set<String> removingIds;

  EventStaffState copyWith({
    StaffLoadStatus? status,
    List<EventStaffMember>? members,
    String? errorMessage,
    bool? isInviting,
    Set<String>? removingIds,
  }) {
    return EventStaffState(
      status: status ?? this.status,
      members: members ?? this.members,
      errorMessage: errorMessage ?? this.errorMessage,
      isInviting: isInviting ?? this.isInviting,
      removingIds: removingIds ?? this.removingIds,
    );
  }
}

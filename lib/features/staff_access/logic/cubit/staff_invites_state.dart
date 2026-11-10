import 'package:evetick_organizer/features/staff_access/data/models/staff_access_models.dart';

enum StaffInvitesStatus { initial, loading, success, failure }

class StaffInvitesState {
  const StaffInvitesState({
    this.status = StaffInvitesStatus.initial,
    this.invitations = const [],
    this.respondingIds = const {},
    this.errorMessage,
  });

  final StaffInvitesStatus status;
  final List<StaffInvitation> invitations;

  /// Event ids of invitations that are being accepted / declined right now.
  final Set<String> respondingIds;
  final String? errorMessage;

  StaffInvitesState copyWith({
    StaffInvitesStatus? status,
    List<StaffInvitation>? invitations,
    Set<String>? respondingIds,
    String? errorMessage,
  }) {
    return StaffInvitesState(
      status: status ?? this.status,
      invitations: invitations ?? this.invitations,
      respondingIds: respondingIds ?? this.respondingIds,
      errorMessage: errorMessage,
    );
  }
}

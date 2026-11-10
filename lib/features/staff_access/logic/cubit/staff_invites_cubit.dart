import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/staff_access/data/models/staff_access_models.dart';
import 'package:evetick_organizer/features/staff_access/data/repositories/staff_access_repository.dart';
import 'package:evetick_organizer/features/staff_access/logic/cubit/staff_invites_state.dart';

class StaffInvitesCubit extends Cubit<StaffInvitesState> {
  StaffInvitesCubit(this._repository) : super(const StaffInvitesState());

  final StaffAccessRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(status: StaffInvitesStatus.loading));

    final result = await _repository.getMyAccess();
    if (isClosed) return;

    result.when(
      success: (access) => emit(
        state.copyWith(
          status: StaffInvitesStatus.success,
          invitations: access.invitations,
        ),
      ),
      failure: (failure) => emit(
        state.copyWith(
          status: StaffInvitesStatus.failure,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  /// Returns `null` on success, otherwise a message to show to the user.
  Future<String?> respond(
    StaffInvitation invitation, {
    required bool accept,
  }) async {
    if (state.respondingIds.contains(invitation.eventId)) return null;

    emit(
      state.copyWith(
        respondingIds: {...state.respondingIds, invitation.eventId},
      ),
    );

    final result = await _repository.respond(
      eventId: invitation.eventId,
      accept: accept,
    );
    if (isClosed) return null;

    final stillResponding = {...state.respondingIds}
      ..remove(invitation.eventId);

    return result.when<String?>(
      success: (_) {
        emit(
          state.copyWith(
            respondingIds: stillResponding,
            invitations: state.invitations
                .where((i) => i.eventId != invitation.eventId)
                .toList(),
          ),
        );
        return null;
      },
      failure: (failure) {
        emit(state.copyWith(respondingIds: stillResponding));
        return failure.message;
      },
    );
  }
}

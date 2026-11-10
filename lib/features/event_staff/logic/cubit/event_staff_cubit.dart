import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_staff/data/models/event_staff_member.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_permission.dart';
import 'package:evetick_organizer/features/event_staff/data/models/staff_role.dart';
import 'package:evetick_organizer/features/event_staff/data/repositories/event_staff_repository.dart';
import 'package:evetick_organizer/features/event_staff/logic/cubit/event_staff_state.dart';

class EventStaffCubit extends Cubit<EventStaffState> {
  EventStaffCubit(this._repository, this.eventId)
    : super(const EventStaffState());

  final EventStaffRepository _repository;
  final String eventId;

  /// [isRefresh] keeps the current list visible while reloading.
  Future<void> loadStaff({bool isRefresh = false}) async {
    if (!isRefresh || state.status != StaffLoadStatus.success) {
      emit(state.copyWith(status: StaffLoadStatus.loading));
    }

    final result = await _repository.getStaff(eventId);
    if (isClosed) return;

    result.when(
      success: (members) => emit(
        state.copyWith(status: StaffLoadStatus.success, members: members),
      ),
      failure: (failure) => emit(
        state.copyWith(
          status: StaffLoadStatus.failure,
          errorMessage: failure.message,
        ),
      ),
    );
  }

  /// Returns `null` on success, otherwise a message to show to the user.
  Future<String?> inviteStaff({
    required String name,
    required String email,
    required StaffRole role,
    required Set<StaffPermission> permissions,
  }) async {
    if (state.isInviting) return 'An invitation is already being sent';

    emit(state.copyWith(isInviting: true));
    final result = await _repository.inviteStaff(
      eventId: eventId,
      name: name,
      email: email,
      role: role,
      permissions: permissions,
    );
    if (isClosed) return null;

    return result.when<String?>(
      success: (member) {
        emit(
          state.copyWith(
            isInviting: false,
            status: StaffLoadStatus.success,
            members: _sorted([...state.members, member]),
          ),
        );
        return null;
      },
      failure: (failure) {
        emit(state.copyWith(isInviting: false));
        return failure.message;
      },
    );
  }

  /// Returns `null` on success, otherwise a message to show to the user.
  Future<String?> removeStaff(EventStaffMember member) async {
    if (state.removingIds.contains(member.id)) return null;

    emit(state.copyWith(removingIds: {...state.removingIds, member.id}));
    final result = await _repository.removeStaff(
      eventId: eventId,
      staffId: member.id,
    );
    if (isClosed) return null;

    final stillRemoving = {...state.removingIds}..remove(member.id);
    return result.when<String?>(
      success: (_) {
        emit(
          state.copyWith(
            removingIds: stillRemoving,
            members: state.members.where((m) => m.id != member.id).toList(),
          ),
        );
        return null;
      },
      failure: (failure) {
        emit(state.copyWith(removingIds: stillRemoving));
        return failure.message;
      },
    );
  }

  List<EventStaffMember> _sorted(List<EventStaffMember> members) {
    return members
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }
}

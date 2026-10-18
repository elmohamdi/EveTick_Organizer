import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_dashboard/data/repositories/event_dashboard_repository.dart';
import 'package:evetick_organizer/features/event_dashboard/logic/cubit/event_dashboard_state.dart';

class EventDashboardCubit extends Cubit<EventDashboardState> {
  EventDashboardCubit(this._repository, this.eventId)
    : super(EventDashboardInitial());

  final EventDashboardRepository _repository;
  final String eventId;

  /// [isRefresh] keeps the current numbers on screen while reloading
  /// (pull-to-refresh) instead of flashing the full-screen loader.
  Future<void> load({bool isRefresh = false}) async {
    if (!isRefresh || state is! EventDashboardSuccess) {
      emit(EventDashboardLoading());
    }

    final result = await _repository.getDashboard(eventId);
    if (isClosed) return;

    result.when(
      success: (dashboard) => emit(EventDashboardSuccess(dashboard)),
      failure: (failure) => emit(EventDashboardFailure(failure.message)),
    );
  }
}

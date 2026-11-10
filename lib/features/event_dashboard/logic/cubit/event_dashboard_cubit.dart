import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/event_dashboard/data/repositories/event_dashboard_repository.dart';
import 'package:evetick_organizer/features/event_dashboard/logic/cubit/event_dashboard_state.dart';
import 'package:flutter/foundation.dart';

class EventDashboardCubit extends Cubit<EventDashboardState> {
  EventDashboardCubit(this._repository, this.eventId)
    : super(EventDashboardInitial());

  final EventDashboardRepository _repository;
  final String eventId;

  StreamSubscription<void>? _salesSubscription;

  /// Only the newest request may emit: a sale can trigger a reload while a
  /// pull-to-refresh is still running, and the older answer must not win.
  int _requestId = 0;

  /// [isRefresh] keeps the current numbers on screen while reloading
  /// (pull-to-refresh, live sales) instead of flashing the full-screen loader.
  Future<void> load({bool isRefresh = false}) async {
    final requestId = ++_requestId;
    if (!isRefresh || state is! EventDashboardSuccess) {
      emit(EventDashboardLoading());
    }

    final result = await _repository.getDashboard(eventId);
    if (isClosed || requestId != _requestId) return;

    result.when(
      success: (dashboard) {
        emit(EventDashboardSuccess(dashboard));
        _watchSales();
      },
      failure: (failure) => emit(EventDashboardFailure(failure.message)),
    );
  }

  /// Reloads the numbers whenever a sale lands, so the dashboard is live.
  void _watchSales() {
    if (_salesSubscription != null) return;

    // The first snapshot is the state [load] has just fetched.
    var isFirstSnapshot = true;
    _salesSubscription = _repository
        .watchSalesChanges(eventId)
        .listen(
          (_) {
            if (isFirstSnapshot) {
              isFirstSnapshot = false;
              return;
            }
            load(isRefresh: true);
          },
          // Not fatal: pull-to-refresh still works without the live updates.
          onError: (Object error, StackTrace stackTrace) {
            debugPrint('EventDashboard live updates stopped: $error');
          },
        );
  }

  @override
  Future<void> close() {
    _salesSubscription?.cancel();
    return super.close();
  }
}

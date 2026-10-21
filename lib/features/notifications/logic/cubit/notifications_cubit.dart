import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/notifications/data/models/app_notification.dart';
import 'package:evetick_organizer/features/notifications/data/repositories/notifications_repository.dart';
import 'package:evetick_organizer/features/notifications/logic/cubit/notifications_state.dart';

/// Keeps a live listener on the signed-in user's notifications. Owned by
/// `MainContainer` so the bell badge on Home and the Notifications screen
/// share one subscription.
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._repository) : super(const NotificationsState());

  final NotificationsRepository _repository;
  StreamSubscription<Result<List<AppNotification>>>? _subscription;

  /// Starts the listener, or restarts it (retry after a failure).
  void start() {
    _subscription?.cancel();
    // Keep what is on screen while a retry is running.
    if (state.notifications.isEmpty) {
      emit(state.copyWith(status: NotificationsStatus.loading));
    }

    _subscription = _repository.watchNotifications().listen(
      _onResult,
      onError: (Object error, StackTrace stackTrace) {
        if (isClosed) return;
        emit(state.copyWith(status: NotificationsStatus.failure));
      },
    );
  }

  void _onResult(Result<List<AppNotification>> result) {
    if (isClosed) return;

    result.when(
      success: (notifications) => emit(
        state.copyWith(
          status: NotificationsStatus.success,
          notifications: notifications,
        ),
      ),
      failure: (_) => emit(state.copyWith(status: NotificationsStatus.failure)),
    );
  }

  /// Fire and forget: the live listener delivers the updated list. A failure
  /// is already logged by the repository and must not block the navigation
  /// that follows a tap.
  Future<void> markAsRead(AppNotification notification) async {
    if (notification.isRead) return;
    await _repository.markAsRead(notification.id);
  }

  /// Returns `false` when the update failed, so the screen can tell the user.
  Future<bool> markAllAsRead() async {
    final unreadIds = [
      for (final notification in state.notifications)
        if (!notification.isRead) notification.id,
    ];
    if (unreadIds.isEmpty) return true;

    final result = await _repository.markAllAsRead(unreadIds);
    if (isClosed) return true;

    return result.when<bool>(success: (_) => true, failure: (_) => false);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

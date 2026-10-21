import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/notifications/data/models/app_notification.dart';

abstract class NotificationsRepository {
  /// Live list (newest first) of the signed-in user's notifications. A failure
  /// is delivered as a [Result.failure] event, never as a stream error.
  Stream<Result<List<AppNotification>>> watchNotifications();

  Future<Result<void>> markAsRead(String id);

  Future<Result<void>> markAllAsRead(Iterable<String> ids);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/features/notifications/data/models/notification_type.dart';

/// One entry of `users/{uid}/notifications/{id}`.
///
/// The backend stores *data* (type + names), never display text, so the app
/// can localize every message itself.
class AppNotification {
  const AppNotification({
    required this.id,
    required this.type,
    required this.eventId,
    required this.eventTitle,
    required this.createdAt,
    this.actorName,
    this.ticketName,
    this.isRead = false,
  });

  final String id;
  final NotificationType type;
  final String eventId;

  /// Empty when the backend had no title; the UI shows a fallback.
  final String eventTitle;
  final DateTime createdAt;

  /// Ticket buyer (ticketPurchased) or invited organizer (staffAccepted /
  /// staffDeclined).
  final String? actorName;

  /// Tier name of the purchased ticket (ticketPurchased only).
  final String? ticketName;
  final bool isRead;

  /// Returns `null` for an unknown [NotificationType] instead of throwing, so
  /// one document from a newer backend can't blank the whole list.
  static AppNotification? tryParse(String id, Map<String, dynamic> map) {
    final type = NotificationType.fromKey(map['type'] as String?);
    if (type == null) return null;

    final createdAt = map['createdAt'];
    return AppNotification(
      id: id,
      type: type,
      eventId: _text(map['eventId']) ?? '',
      eventTitle: _text(map['eventTitle']) ?? '',
      actorName: _text(map['actorName']),
      ticketName: _text(map['ticketName']),
      createdAt: createdAt is Timestamp ? createdAt.toDate() : DateTime.now(),
      isRead: map['read'] == true,
    );
  }

  static String? _text(Object? value) {
    final text = value is String ? value.trim() : '';
    return text.isEmpty ? null : text;
  }
}

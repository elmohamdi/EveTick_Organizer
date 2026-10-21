/// What a notification is about. Stored in Firestore as [key] so a newer
/// backend can add types without breaking older app versions (unknown keys
/// are skipped by `AppNotification.tryParse`).
enum NotificationType {
  ticketPurchased('ticketPurchased'),
  staffAccepted('staffAccepted'),
  staffDeclined('staffDeclined'),
  eventLive('eventLive');

  const NotificationType(this.key);

  final String key;

  static NotificationType? fromKey(String? key) {
    for (final type in values) {
      if (type.key == key) return type;
    }
    return null;
  }
}

import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/notifications/data/models/app_notification.dart';
import 'package:evetick_organizer/features/notifications/data/models/notification_type.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// Display text of a notification. The backend only sends data, so adding a
/// language or changing a sentence never needs a backend change.
extension NotificationLabels on AppNotification {
  String title(AppLocalizations l10n) => switch (type) {
    NotificationType.ticketPurchased => l10n.notificationTicketPurchasedTitle,
    NotificationType.staffAccepted => l10n.notificationStaffAcceptedTitle,
    NotificationType.staffDeclined => l10n.notificationStaffDeclinedTitle,
    NotificationType.eventLive => l10n.notificationEventLiveTitle,
  };

  String body(AppLocalizations l10n) {
    final event = eventTitle.isEmpty ? l10n.myEventsNoTitle : eventTitle;
    final actor = actorName ?? l10n.notificationSomeone;

    return switch (type) {
      NotificationType.ticketPurchased =>
        ticketCount > 1
            ? l10n.notificationTicketsPurchasedBody(actor, ticketCount, event)
            : l10n.notificationTicketPurchasedBody(
                actor,
                ticketName ?? l10n.notificationATicket,
                event,
              ),
      NotificationType.staffAccepted => l10n.notificationStaffAcceptedBody(
        actor,
        event,
      ),
      NotificationType.staffDeclined => l10n.notificationStaffDeclinedBody(
        actor,
        event,
      ),
      NotificationType.eventLive => l10n.notificationEventLiveBody(event),
    };
  }
}

extension NotificationTypeStyle on NotificationType {
  IconData get icon => switch (this) {
    NotificationType.ticketPurchased => Icons.confirmation_number_outlined,
    NotificationType.staffAccepted => Icons.how_to_reg_outlined,
    NotificationType.staffDeclined => Icons.person_off_outlined,
    NotificationType.eventLive => Icons.sensors_rounded,
  };

  Color get color => switch (this) {
    NotificationType.ticketPurchased => ColorsManager.confirmed,
    NotificationType.staffAccepted => ColorsManager.confirmed,
    NotificationType.staffDeclined => ColorsManager.red,
    NotificationType.eventLive => ColorsManager.orange,
  };
}

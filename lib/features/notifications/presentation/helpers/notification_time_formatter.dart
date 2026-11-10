import 'package:evetick_organizer/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// "Just now" / "5m ago" / "3h ago" / "2d ago", then a plain date.
abstract final class NotificationTimeFormatter {
  static String format(BuildContext context, DateTime time, {DateTime? now}) {
    final l10n = AppLocalizations.of(context)!;
    final difference = (now ?? DateTime.now()).difference(time);

    // Also covers a slightly negative difference caused by clock skew.
    if (difference.inMinutes < 1) return l10n.notificationTimeNow;
    if (difference.inMinutes < 60) {
      return l10n.notificationTimeMinutes(difference.inMinutes);
    }
    if (difference.inHours < 24) {
      return l10n.notificationTimeHours(difference.inHours);
    }
    if (difference.inDays < 7) {
      return l10n.notificationTimeDays(difference.inDays);
    }
    return DateFormat(
      'MMM dd, yyyy',
      Localizations.localeOf(context).toString(),
    ).format(time);
  }
}

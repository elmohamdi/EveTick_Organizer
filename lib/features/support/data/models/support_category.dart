import 'package:flutter/material.dart';

/// Topics a support request or an FAQ can belong to.
/// [key] is the stable value stored in Firestore.
enum SupportCategory {
  account('account', Icons.person_outline_rounded),
  events('events', Icons.event_note_rounded),
  ticketing('ticketing', Icons.confirmation_number_rounded),
  payouts('payouts', Icons.payments_rounded),
  technical('technical', Icons.bug_report_outlined),
  feedback('feedback', Icons.lightbulb_outline_rounded);

  const SupportCategory(this.key, this.icon);

  final String key;
  final IconData icon;

  /// Topics shown as cards on the Help & Support screen (they filter the FAQs).
  static const List<SupportCategory> helpCategories = [
    account,
    events,
    ticketing,
    payouts,
  ];

  static SupportCategory? fromKey(String? key) {
    for (final category in values) {
      if (category.key == key) return category;
    }
    return null;
  }
}

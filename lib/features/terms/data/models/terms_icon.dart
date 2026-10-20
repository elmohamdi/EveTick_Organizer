import 'package:flutter/material.dart';

/// Icons a term can show. [key] is the stable value stored in Firestore.
enum TermsIcon {
  block('block', Icons.block_rounded),
  security('security', Icons.security_rounded),
  personOff('person_off', Icons.person_off_outlined),
  check('check', Icons.check_circle_outline_rounded);

  const TermsIcon(this.key, this.icon);

  final String key;
  final IconData icon;

  static TermsIcon fromKey(String? key) {
    for (final value in values) {
      if (value.key == key) return value;
    }
    return check;
  }
}

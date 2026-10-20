import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

class Formatters {
  Formatters._();

  /// Single place to change when the app supports more than one currency.
  static const String currency = 'EGP';

  static String _locale(BuildContext context) =>
      Localizations.localeOf(context).toString();

  static String number(BuildContext context, num value) =>
      NumberFormat.decimalPattern(_locale(context)).format(value);

  /// Formats Egyptian pounds using the active application locale.
  static String money(BuildContext context, num value) {
    final isWhole = value == value.roundToDouble();
    final locale = _locale(context);
    return NumberFormat.currency(
      locale: locale,
      name: currency,
      symbol: locale.startsWith('ar') ? 'ج.م.‏' : currency,
      decimalDigits: isWhole ? 0 : 2,
    ).format(value);
  }
}

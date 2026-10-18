import 'package:intl/intl.dart';

class Formatters {
  Formatters._();

  /// Single place to change when the app supports more than one currency.
  static const String currency = 'EGP';

  static final NumberFormat _number = NumberFormat.decimalPattern('en');

  static String number(num value) => _number.format(value);

  /// `1,500 EGP` for whole amounts, `1,500.50 EGP` otherwise.
  static String money(num value) {
    final isWhole = value == value.roundToDouble();
    final formatted = NumberFormat.decimalPatternDigits(
      locale: 'en',
      decimalDigits: isWhole ? 0 : 2,
    ).format(value);
    return '$formatted $currency';
  }
}

import 'package:evetick_organizer/core/helpers/app_regex.dart';
import 'package:flutter/services.dart';

/// The payment methods an organizer can use to receive money.
enum PaymentMethodType {
  vodafoneCash(
    key: 'vodafone_cash',
    title: 'Vodafone Cash',
    logoAsset: 'assets/images/vodafone_cash_logo.png',
    fieldLabel: 'Wallet Number',
    hint: '010XXXXXXXX',
  ),
  orangeCash(
    key: 'orange_cash',
    title: 'Orange Cash',
    logoAsset: 'assets/images/orange_cash_logo.png',
    fieldLabel: 'Wallet Number',
    hint: '012XXXXXXXX',
  ),
  instaPay(
    key: 'instapay',
    title: 'InstaPay',
    logoAsset: 'assets/images/instapay_logo.png',
    fieldLabel: 'InstaPay Address or Phone',
    hint: 'name@instapay or 01XXXXXXXXX',
  ),
  paypal(
    key: 'paypal',
    title: 'PayPal',
    fieldLabel: 'PayPal Email',
    hint: 'example@email.com',
  );

  const PaymentMethodType({
    required this.key,
    required this.title,
    required this.fieldLabel,
    required this.hint,
    this.logoAsset,
  });

  /// Stable identifier stored in Firebase.
  final String key;
  final String title;
  final String fieldLabel;
  final String hint;

  /// `null` when no logo asset is available (the UI shows an icon instead).
  final String? logoAsset;

  bool get isWallet => this == vodafoneCash || this == orangeCash;

  TextInputType get keyboardType {
    return isWallet ? TextInputType.phone : TextInputType.emailAddress;
  }

  List<TextInputFormatter> get inputFormatters {
    if (!isWallet) return const [];
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(11),
    ];
  }

  String? validate(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return 'Please enter your ${fieldLabel.toLowerCase()}';

    switch (this) {
      case PaymentMethodType.vodafoneCash:
        return RegExp(r'^010\d{8}$').hasMatch(input)
            ? null
            : 'Enter a valid Vodafone Cash number';
      case PaymentMethodType.orangeCash:
        return RegExp(r'^012\d{8}$').hasMatch(input)
            ? null
            : 'Enter a valid Orange Cash number';
      case PaymentMethodType.instaPay:
        final isPhone = RegExp(r'^01[0125]\d{8}$').hasMatch(input);
        final isAddress = RegExp(
          r'^[A-Za-z0-9._-]+@instapay$',
          caseSensitive: false,
        ).hasMatch(input);
        return isPhone || isAddress
            ? null
            : 'Enter a valid InstaPay address or phone number';
      case PaymentMethodType.paypal:
        return AppRegex.isEmailValid(input) ? null : 'Enter a valid email';
    }
  }
}

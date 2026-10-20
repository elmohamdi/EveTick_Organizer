import 'package:evetick_organizer/core/helpers/app_regex.dart';
import 'package:flutter/services.dart';
import 'package:evetick_organizer/l10n/app_localizations.dart';

/// The payment methods an organizer can use to receive money.
enum PaymentMethodType {
  vodafoneCash(
    key: 'vodafone_cash',
    title: 'Vodafone Cash',
    logoAsset: 'assets/images/vodafone_cash_logo.png',
    hint: '010XXXXXXXX',
  ),
  orangeCash(
    key: 'orange_cash',
    title: 'Orange Cash',
    logoAsset: 'assets/images/orange_cash_logo.png',
    hint: '012XXXXXXXX',
  ),
  instaPay(
    key: 'instapay',
    title: 'InstaPay',
    logoAsset: 'assets/images/instapay_logo.png',
    hint: 'name@instapay or 01XXXXXXXXX',
  ),
  paypal(
    key: 'paypal',
    title: 'PayPal',
    hint: 'example@email.com',
  );

  const PaymentMethodType({
    required this.key,
    required this.title,
    required this.hint,
    this.logoAsset,
  });

  /// Stable identifier stored in Firebase.
  final String key;
  final String title;
  final String hint;

  /// `null` when no logo asset is available (the UI shows an icon instead).
  final String? logoAsset;

  /// Label of the input field, translated.
  String fieldLabelOf(AppLocalizations l10n) {
    switch (this) {
      case PaymentMethodType.vodafoneCash:
      case PaymentMethodType.orangeCash:
        return l10n.createEventWalletNumber;
      case PaymentMethodType.instaPay:
        return l10n.createEventInstaPayField;
      case PaymentMethodType.paypal:
        return l10n.createEventPayPalField;
    }
  }

  /// Placeholder of the input field, translated.
  String hintOf(AppLocalizations l10n) {
    return this == instaPay ? l10n.createEventInstaPayHint : hint;
  }

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

  String? validate(String? value, AppLocalizations l10n) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return l10n.createEventPaymentEnterField(
        fieldLabelOf(l10n).toLowerCase(),
      );

    switch (this) {
      case PaymentMethodType.vodafoneCash:
        return RegExp(r'^010\d{8}$').hasMatch(input)
            ? null
            : l10n.createEventInvalidVodafone;
      case PaymentMethodType.orangeCash:
        return RegExp(r'^012\d{8}$').hasMatch(input)
            ? null
            : l10n.createEventInvalidOrange;
      case PaymentMethodType.instaPay:
        final isPhone = RegExp(r'^01[0125]\d{8}$').hasMatch(input);
        final isAddress = RegExp(
          r'^[A-Za-z0-9._-]+@instapay$',
          caseSensitive: false,
        ).hasMatch(input);
        return isPhone || isAddress
            ? null
            : l10n.createEventInvalidInstaPay;
      case PaymentMethodType.paypal:
        return AppRegex.isEmailValid(input) ? null : l10n.createEventInvalidEmail;
    }
  }
}

import 'package:evetick_organizer/features/create_event/data/models/payment_method_type.dart';

class PaymentMethodModel {
  final PaymentMethodType type;

  /// Wallet number, InstaPay address, or PayPal email.
  final String value;

  const PaymentMethodModel({required this.type, required this.value});

  Map<String, dynamic> toJson() {
    return {'type': type.key, 'value': value};
  }
}

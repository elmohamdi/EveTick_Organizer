import 'package:evetick_organizer/features/create_event/data/models/payment_method_model.dart';
import 'package:evetick_organizer/features/create_event/data/models/payment_method_type.dart';
import 'package:flutter/material.dart';

class PaymentMethodEntry {
  PaymentMethodEntry(this.type) : controller = TextEditingController();

  final PaymentMethodType type;
  final TextEditingController controller;
  bool isEnabled = false;

  PaymentMethodModel toModel() {
    return PaymentMethodModel(type: type, value: controller.text.trim());
  }

  void dispose() {
    controller.dispose();
  }
}

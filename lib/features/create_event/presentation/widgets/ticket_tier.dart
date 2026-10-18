import 'package:flutter/material.dart';

class TicketTier {
  TicketTier()
    : nameController = TextEditingController(),
      priceController = TextEditingController(),
      quantityController = TextEditingController(),
      descriptionController = TextEditingController();

  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController descriptionController;

  void dispose() {
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    descriptionController.dispose();
  }
}

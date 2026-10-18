import 'package:flutter/material.dart';

/// Holds the text controllers for one editable "section" row while the
/// organizer is filling the sections form. Mirrors the [TicketTier]
/// controller-holder pattern used in the ticket step.
class VenueSection {
  VenueSection()
    : nameController = TextEditingController(),
      capacityController = TextEditingController();

  final TextEditingController nameController;
  final TextEditingController capacityController;

  void dispose() {
    nameController.dispose();
    capacityController.dispose();
  }
}

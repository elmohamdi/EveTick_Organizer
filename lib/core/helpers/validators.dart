import 'package:flutter/material.dart';

class EventValidators {
  // Event Title
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Event title is required';
    }
    if (value.trim().length < 3) {
      return 'Title must be at least 3 characters';
    }
    if (value.trim().length > 100) {
      return 'Title must not exceed 100 characters';
    }
    return null;
  }

  // Category
  static String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a category';
    }
    return null;
  }

  // Start Date
  static String? validateStartDate(DateTime? value) {
    if (value == null) {
      return 'Start date is required';
    }
    if (value.isBefore(DateTime.now())) {
      return 'Start date cannot be in the past';
    }
    return null;
  }

  // Start Time
  static String? validateStartTime(TimeOfDay? value) {
    if (value == null) {
      return 'Start time is required';
    }
    return null;
  }

  // End Date & Time (بيحتاج يتقارن بالـ start)
  static String? validateEndDateTime({
    required DateTime? startDate,
    required TimeOfDay? startTime,
    required DateTime? endDate,
    required TimeOfDay? endTime,
  }) {
    if (endDate == null) {
      return 'End date is required';
    }
    if (endTime == null) {
      return 'End time is required';
    }
    if (startDate != null && startTime != null) {
      final start = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
        startTime.hour,
        startTime.minute,
      );
      final end = DateTime(
        endDate.year,
        endDate.month,
        endDate.day,
        endTime.hour,
        endTime.minute,
      );
      if (end.isBefore(start) || end.isAtSameMomentAs(start)) {
        return 'End date/time must be after start date/time';
      }
    }
    return null;
  }

  // Event Location (لو مش Online event)
  static String? validateLocation(String? value, {required bool isOnline}) {
    if (isOnline) return null; // مش لازم location لو online
    if (value == null || value.trim().isEmpty) {
      return 'Location is required for in-person events';
    }
    if (value.trim().length < 3) {
      return 'Please enter a valid location';
    }
    return null;
  }
}

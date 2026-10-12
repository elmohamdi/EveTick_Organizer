import 'package:evetick_organizer/features/create_event/data/models/payment_method_model.dart';
import 'package:evetick_organizer/features/create_event/data/models/seating_config_model.dart';
import 'package:evetick_organizer/features/create_event/data/models/ticket_tier_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'create_event_state.freezed.dart';

enum CreateEventStatus { initial, loading, success, failure }

@freezed
abstract class CreateEventState with _$CreateEventState {
  const factory CreateEventState({
    @Default(CreateEventStatus.initial) CreateEventStatus status,

    String? eventTitle,
    String? eventCategory,
    String? eventDescription,
    String? eventLocation,
    String? eventUrl,

    DateTime? startDate,
    TimeOfDay? startTime,
    DateTime? endDate,
    TimeOfDay? endTime,

    @Default(true) bool isOnlineEvent,

    XFile? eventCoverImage,

    @Default([]) List<XFile> eventGalleryPhotos,

    @Default([]) List<TicketTierModel> eventTicketTiers,

    @Default([]) List<PaymentMethodModel> paymentMethods,

    SeatingConfigModel? seatingConfig,

    String? errorMessage,
  }) = _CreateEventState;
}

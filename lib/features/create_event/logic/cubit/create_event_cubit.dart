import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/features/create_event/data/models/event_model.dart';
import 'package:evetick_organizer/features/create_event/data/models/seating_config_model.dart';
import 'package:evetick_organizer/features/create_event/data/models/ticket_tier_model.dart';
import 'package:evetick_organizer/features/create_event/data/repositories/create_event_repository.dart';
import 'package:evetick_organizer/features/create_event/logic/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  final CreateEventRepository createEventRepository;

  CreateEventCubit({required this.createEventRepository})
    : super(const CreateEventState());

  Future<void> createEvent(EventModel event) async {
    try {
      emit(
        state.copyWith(status: CreateEventStatus.loading, errorMessage: null),
      );

      await createEventRepository.createEvent(event);

      emit(state.copyWith(status: CreateEventStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: CreateEventStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void updateTitle(String title) {
    emit(state.copyWith(eventTitle: title));
  }
  void updateCategory(String category) {
    emit(state.copyWith(eventCategory: category));
  }
  void updateDescription(String description) {
    emit(state.copyWith(eventDescription: description));
  }
  void updateLocation(String location) {
    emit(state.copyWith(eventLocation: location));
  }
  void updateStartDate(DateTime startDate) {
    emit(state.copyWith(startDate: startDate));
  }
  void updateStartTime(TimeOfDay startTime) {
    emit(state.copyWith(startTime: startTime));
  }
  void updateEndDate(DateTime endDate) {
    emit(state.copyWith(endDate: endDate));
  }
  void updateEndTime(TimeOfDay endTime) {
    emit(state.copyWith(endTime: endTime));
  }
  void updateIsOnlineEvent(bool isOnlineEvent) {
    emit(state.copyWith(isOnlineEvent: isOnlineEvent));
  }
  void updateEventCoverImage(XFile eventCoverImage) {
    emit(state.copyWith(eventCoverImage: eventCoverImage));
  }
  void updateEventGalleryPhotos(List<XFile> eventGalleryPhotos) {
    emit(state.copyWith(eventGalleryPhotos: eventGalleryPhotos));
  }
  void updateEventTicketTiers(List<TicketTierModel> eventTicketTiers) {
    emit(state.copyWith(eventTicketTiers: eventTicketTiers));
  }
  void updateSeatingConfig(SeatingConfigModel seatingConfig) {
    emit(state.copyWith(seatingConfig: seatingConfig));
  }
  void clearEndDate() {
  emit(state.copyWith(endDate: null));
}

}
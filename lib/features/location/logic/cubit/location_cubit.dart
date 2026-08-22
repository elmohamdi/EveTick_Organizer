import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/features/location/data/models/location_model.dart';
import 'package:evetick_organizer/features/location/data/repos/location_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository locationRepository;
  LocationModel? selectedLocation;
  LocationCubit({required this.locationRepository, this.selectedLocation})
    : super(LocationState.initial());

  Future<void> getCurrentLocation() async {
    emit(const LocationState.loading());
    try {
      final location = await locationRepository.getCurrentLocation();
      selectedLocation = location;
      emit(LocationState.loaded(location));
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }

  Future<void> saveLocation() async {
    if (selectedLocation == null) return;
    emit(LocationState.loading());
    try {
      await locationRepository.saveLocation(selectedLocation!);
      emit(LocationState.saved());
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }

  void setSelectedLocation(LocationModel location) {
    selectedLocation = location;
    emit(LocationState.locationSelected(location));
  }

  Future<void> updateSelectedLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final location = await locationRepository.getLocationFromCoordinates(
        latitude: latitude,
        longitude: longitude,
      );

      selectedLocation = location;

      emit(LocationState.locationUpdated(location));
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }

  Future<void> skipLocation() async {
    emit(const LocationState.loading());

    try {
      await locationRepository.skipLocation();
      emit(const LocationState.saved());
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }
}

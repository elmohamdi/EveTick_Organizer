import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evetick_organizer/features/location/data/models/location_exception.dart';
import 'package:evetick_organizer/features/location/data/models/location_model.dart';
import 'package:evetick_organizer/features/location/data/repos/location_repository.dart';
import 'package:evetick_organizer/features/location/logic/cubit/map_picker_state.dart';

/// State of the "pick a place on the map" screen.
///
/// Deliberately separate from `LocationCubit`: that cubit drives the
/// onboarding flow (loading dialog, save, navigation), and an error emitted
/// from here would have made its listener pop the map.
class MapPickerCubit extends Cubit<MapPickerState> {
  MapPickerCubit(this._repository) : super(const MapPickerState());

  final LocationRepository _repository;

  /// Only the newest geocoding request may update the address.
  int _geocodeId = 0;

  static const Duration _geocodeTimeout = Duration(seconds: 8);
  static const Duration _locateTimeout = Duration(seconds: 12);
  static const Duration _savedLocationTimeout = Duration(seconds: 3);

  /// Starts on the user's saved location when there is one.
  Future<void> initialize() async {
    var latitude = kMapPickerDefaultLatitude;
    var longitude = kMapPickerDefaultLongitude;

    try {
      final saved = await _repository.getSavedLocation().timeout(
        _savedLocationTimeout,
      );
      if (saved != null && !saved.isEmpty) {
        latitude = saved.latitude;
        longitude = saved.longitude;
      }
    } catch (_) {
      // Offline / not signed in: the default start is fine.
    }

    if (isClosed) return;
    emit(
      state.copyWith(
        isInitialized: true,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  void onCameraMoveStarted() {
    if (!state.isMoving) emit(state.copyWith(isMoving: true));
  }

  /// The camera stopped: look up the address of the pin.
  Future<void> onCameraIdle(double latitude, double longitude) async {
    final requestId = ++_geocodeId;
    emit(
      state.copyWith(
        latitude: latitude,
        longitude: longitude,
        isMoving: false,
        addressStatus: MapPickerAddressStatus.resolving,
        clearAddress: true,
      ),
    );

    String? address;
    try {
      final location = await _repository
          .getLocationFromCoordinates(latitude: latitude, longitude: longitude)
          .timeout(_geocodeTimeout);
      address = location.address;
    } catch (_) {
      // Geocoder unavailable / nothing here: the spot can still be confirmed.
      address = null;
    }

    if (isClosed || requestId != _geocodeId) return;

    final hasAddress = address != null && address.trim().isNotEmpty;
    emit(
      state.copyWith(
        address: hasAddress ? address : null,
        clearAddress: !hasAddress,
        addressStatus: hasAddress
            ? MapPickerAddressStatus.resolved
            : MapPickerAddressStatus.unavailable,
      ),
    );
  }

  /// Moves the map to the device position. Returns why it failed (so the
  /// screen can tell the user), or `null` on success.
  Future<MapPickerLocateError?> useCurrentLocation() async {
    if (state.isLocating) return null;
    emit(state.copyWith(isLocating: true));

    try {
      final position = await _repository.getCurrentPosition().timeout(
        _locateTimeout,
      );
      if (isClosed) return null;
      emit(
        state.copyWith(
          isLocating: false,
          recenter: MapPickerRecenter(position.latitude, position.longitude),
        ),
      );
      return null;
    } on LocationException catch (e) {
      if (isClosed) return null;
      emit(state.copyWith(isLocating: false));
      return switch (e.type) {
        LocationErrorType.serviceDisabled =>
          MapPickerLocateError.serviceDisabled,
        LocationErrorType.permissionDenied =>
          MapPickerLocateError.permissionDenied,
        LocationErrorType.addressNotFound => MapPickerLocateError.failed,
      };
    } catch (_) {
      if (isClosed) return null;
      emit(state.copyWith(isLocating: false));
      return MapPickerLocateError.failed;
    }
  }

  /// The place to return to the caller. When no address could be found the
  /// coordinates stand in for it, so callers that need text (the event
  /// location field) never get an empty value.
  LocationModel get confirmedLocation {
    final address = state.addressStatus == MapPickerAddressStatus.resolved
        ? state.address
        : null;
    return LocationModel(
      latitude: state.latitude,
      longitude: state.longitude,
      address:
          address ??
          '${state.latitude.toStringAsFixed(5)}, '
              '${state.longitude.toStringAsFixed(5)}',
    );
  }
}

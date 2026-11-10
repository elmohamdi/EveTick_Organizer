/// Default map centre (Alexandria) until the saved location is known.
const double kMapPickerDefaultLatitude = 31.2001;
const double kMapPickerDefaultLongitude = 29.9187;

enum MapPickerAddressStatus { resolving, resolved, unavailable }

enum MapPickerLocateError { serviceDisabled, permissionDenied, failed }

/// "Move the camera here". A new instance = a new request (compared by
/// identity), so asking for the same spot twice still animates.
class MapPickerRecenter {
  const MapPickerRecenter(this.latitude, this.longitude, {this.zoom = 16});

  final double latitude;
  final double longitude;
  final double zoom;
}

class MapPickerState {
  const MapPickerState({
    this.isInitialized = false,
    this.latitude = kMapPickerDefaultLatitude,
    this.longitude = kMapPickerDefaultLongitude,
    this.address,
    this.addressStatus = MapPickerAddressStatus.resolving,
    this.isMoving = false,
    this.isLocating = false,
    this.recenter,
  });

  /// False until the start position (saved location or default) is known.
  final bool isInitialized;
  final double latitude;
  final double longitude;

  /// Only meaningful when [addressStatus] is `resolved`.
  final String? address;
  final MapPickerAddressStatus addressStatus;

  /// The user is dragging / the camera is still animating.
  final bool isMoving;

  /// "My location" is waiting for the device position.
  final bool isLocating;
  final MapPickerRecenter? recenter;

  bool get canConfirm =>
      isInitialized &&
      !isMoving &&
      addressStatus != MapPickerAddressStatus.resolving;

  MapPickerState copyWith({
    bool? isInitialized,
    double? latitude,
    double? longitude,
    String? address,
    bool clearAddress = false,
    MapPickerAddressStatus? addressStatus,
    bool? isMoving,
    bool? isLocating,
    MapPickerRecenter? recenter,
  }) {
    return MapPickerState(
      isInitialized: isInitialized ?? this.isInitialized,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: clearAddress ? null : (address ?? this.address),
      addressStatus: addressStatus ?? this.addressStatus,
      isMoving: isMoving ?? this.isMoving,
      isLocating: isLocating ?? this.isLocating,
      recenter: recenter ?? this.recenter,
    );
  }
}

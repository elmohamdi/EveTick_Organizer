part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;

  const factory LocationState.loading() = _Loading;

  const factory LocationState.loaded(LocationModel location) = _Loaded;
  const factory LocationState.locationSelected(LocationModel location) =
      _LocationSelected;
  const factory LocationState.locationUpdated(LocationModel location)
    = _LocationUpdated;
  const factory LocationState.saved() = _Saved;

  const factory LocationState.error(String message) = _Error;
}

import 'package:evetick_organizer/features/location/data/models/location_model.dart';

abstract class LocationRepository {
  Future<LocationModel> getCurrentLocation();
  Future<LocationModel?> getSavedLocation();
  Future<LocationModel> getLocationFromCoordinates({
    required double latitude,
    required double longitude,
  });
  Future<void> saveLocation(LocationModel location);
  Future<void> skipLocation();
}

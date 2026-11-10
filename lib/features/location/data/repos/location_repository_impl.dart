import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evetick_organizer/features/location/data/models/location_exception.dart';
import 'package:evetick_organizer/features/location/data/models/location_model.dart';
import 'package:evetick_organizer/features/location/data/repos/location_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepositoryImpl implements LocationRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  LocationRepositoryImpl({required this.firestore, required this.auth});

  @override
  Future<LocationModel> getCurrentLocation() async {
    final position = await _currentPosition();
    return getLocationFromCoordinates(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  @override
  Future<LocationModel> getCurrentPosition() async {
    final position = await _currentPosition();
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  Future<Position> _currentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationException(
        LocationErrorType.serviceDisabled,
        'Location service disabled',
      );
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const LocationException(
        LocationErrorType.permissionDenied,
        'Location permission denied',
      );
    }

    return Geolocator.getCurrentPosition();
  }

  @override
  Future<void> saveLocation(LocationModel location) async {
    final uid = auth.currentUser!.uid;

    await firestore.collection('users').doc(uid).update({
      'location': location.toJson(),
      'locationSkipped': false,
    });
  }

  @override
  Future<LocationModel?> getSavedLocation() async {
    final uid = auth.currentUser?.uid;
    if (uid == null) return null;

    final doc = await firestore.collection('users').doc(uid).get();

    if (!doc.exists) return null;

    final data = doc.data();
    if (data?['locationSkipped'] == true) {
      return LocationModel(latitude: 0, longitude: 0, address: 'Not Defined');
    }
    final location = data?['location'];

    if (location == null) return null;

    return LocationModel.fromJson(location);
  }

  @override
  Future<void> skipLocation() async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'locationSkipped': true,
    });
  }

  @override
  Future<LocationModel> getLocationFromCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    final placemarks = await placemarkFromCoordinates(latitude, longitude);

    // Open sea / desert: the geocoder answers with an empty list.
    if (placemarks.isEmpty) {
      throw const LocationException(
        LocationErrorType.addressNotFound,
        'No address found for this location',
      );
    }

    final place = placemarks.first;
    final parts = <String>[
      for (final part in [
        // `locality` is often empty outside big cities.
        if (place.locality?.isNotEmpty ?? false)
          place.locality
        else if (place.subAdministrativeArea?.isNotEmpty ?? false)
          place.subAdministrativeArea
        else
          place.administrativeArea,
        place.country,
      ])
        if (part != null && part.isNotEmpty) part,
    ];

    return LocationModel(
      latitude: latitude,
      longitude: longitude,
      address: parts.isEmpty ? null : parts.join(', '),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
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
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location service disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('Location permission denied');
    }
    Position position = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final place = placemarks.first;
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      address: [place.locality, place.country].whereType<String>().join(', '),
    );
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
    final place = placemarks.first;

    return LocationModel(
      latitude: latitude,
      longitude: longitude,
      address: [place.locality, place.country].whereType<String>().join(', '),
    );
  }
}

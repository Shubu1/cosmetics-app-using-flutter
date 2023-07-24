import 'package:flutter_login/productModel/locationData.dart';
import 'package:flutter_login/productModel/locationModel.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final locationProvider = FutureProvider<LocationData>((ref) async {
  final permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    throw Exception('Location permission denied');
  }

  final position = await Geolocator.getCurrentPosition();
  final placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  final country = placemarks.first.country ?? '';
  final district = placemarks.first.subAdministrativeArea ?? '';

  final locationModel = LocationModel(
    latitude: position.latitude,
    longitude: position.longitude,
    country: country,
    district: district,
  );

  return LocationData(position: position, locationModel: locationModel);
});

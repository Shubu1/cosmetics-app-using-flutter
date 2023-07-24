import 'package:flutter_login/productModel/locationModel.dart';
import 'package:geolocator/geolocator.dart';

class LocationData {
  final Position position;
  final LocationModel locationModel;

  LocationData({
    required this.position,
    required this.locationModel,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_login/constants/apptheme.dart';
import 'package:flutter_login/productProvider/locationProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends ConsumerWidget {
  const LocationPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Location'),
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final locationAsyncValue = ref.watch(locationProvider);
          return locationAsyncValue.when(
            data: (locationData) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 10.0, right: 10.0, bottom: 70.0),
                child: SizedBox(
                  height: 200,
                  child: Card(
                    color: Colors.green[100],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Latitude: ${locationData.position.latitude}',
                            style: AppTheme.bigText.copyWith(
                                color: Colors.black,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                          Text('Longitude: ${locationData.position.longitude}',
                              style: AppTheme.bigText.copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic)),
                          Text(
                            'Country: ${locationData.locationModel.country}',
                            style: AppTheme.bigText.copyWith(
                                fontSize: 18,
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'District: ${locationData.locationModel.district}',
                            style: AppTheme.bigText.copyWith(
                                fontSize: 18,
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                  locationData.position.latitude,
                                  locationData.position.longitude,
                                ),
                                zoom: 15.0,
                              ),
                              markers: <Marker>{
                                Marker(
                                  markerId: const MarkerId('current_location'),
                                  position: LatLng(
                                    locationData.position.latitude,
                                    locationData.position.longitude,
                                  ),
                                  infoWindow: const InfoWindow(
                                      title: 'Current Location'),
                                ),
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          );
        },
      ),
    );
  }
}

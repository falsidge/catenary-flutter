import 'package:flutter/material.dart';
import 'package:maplibre_gl/mapbox_gl.dart';
import 'package:location/location.dart';

class CatenaryMapView extends StatefulWidget {
  const CatenaryMapView({super.key});

  @override
  State<CatenaryMapView> createState() => _CatenaryMapViewState();
}

class _CatenaryMapViewState extends State<CatenaryMapView> {
  late MaplibreMapController mapController;
  Location location = new Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData? _locationData;

  Future<void> _onMapCreated(MaplibreMapController controller) async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.enableBackgroundMode(enable: true);
    _locationData = await location.getLocation();
    mapController = controller;
    mapController.addCircle(CircleOptions(
      circleRadius: 10,
      circleColor: '#2563EB',
      circleOpacity: 1,
      circleStrokeWidth: 1,
      circleStrokeColor: '#ffffff',
      geometry: LatLng(
          _locationData?.latitude ?? 0.0, _locationData?.longitude ?? 0.0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MaplibreMap(
          onMapCreated: _onMapCreated,
          compassEnabled: false,
          styleString:
              'https://api.maptiler.com/maps/68c2a685-a6e4-4e26-b1c1-25b394003539/style.json?key=tf30gb2F4vIsBW5k9Msd',
          initialCameraPosition: const CameraPosition(
              target: LatLng(33, -117), zoom: 7.0, bearing: 0.0, tilt: 0.0),
          trackCameraPosition: true,
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 25,
            ),
            FloatingActionButton(
              onPressed: () {
                _locationData != null
                    ? mapController.animateCamera(CameraUpdate.bearingTo(0.0),
                        duration: const Duration(seconds: 2))
                    : null;
              },
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF0a233f),
              shape: const CircleBorder(),
              mouseCursor: SystemMouseCursors.click,
              tooltip: "Reset bearing to North",
              child: const Icon(Icons.explore),
            ),
            const Spacer(),
            FloatingActionButton(
              onPressed: () {
                _locationData != null
                    ? mapController.animateCamera(
                        CameraUpdate.newCameraPosition(CameraPosition(
                            target: LatLng(_locationData?.latitude ?? 0.0,
                                _locationData?.longitude ?? 0.0),
                            zoom: 11.0,
                            bearing: 0.0,
                            tilt: 0.0)),
                        duration: const Duration(seconds: 2))
                    : null;
              },
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF0a233f),
              shape: const CircleBorder(),
              mouseCursor: SystemMouseCursors.click,
              child: const Icon(Icons.my_location),
            ),
          ],
        ));
  }
}

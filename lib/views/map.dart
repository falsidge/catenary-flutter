import 'package:flutter/material.dart';
import 'package:maplibre_gl/mapbox_gl.dart';

class CatenaryMapView extends StatelessWidget {
  const CatenaryMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaplibreMap(
      styleString: 'https://api.maptiler.com/maps/68c2a685-a6e4-4e26-b1c1-25b394003539/style.json?key=tf30gb2F4vIsBW5k9Msd',
      initialCameraPosition: const CameraPosition(
          target: LatLng(33, -117),
          zoom: 7.0,
          bearing: 0.0,
          tilt: 0.0
      ),
    );
  }
}

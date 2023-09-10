import 'package:flutter/material.dart';
import 'package:maplibre_gl/mapbox_gl.dart';

class CatenaryMapView extends StatelessWidget {
  const CatenaryMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaplibreMap(
      styleString: 'https://tiles.stadiamaps.com/styles/alidade_smooth_dark.json?api_key=5dec71cf-cb5d-4714-b87d-188dea090197',
      initialCameraPosition: const CameraPosition(
          target: LatLng(33, -117),
          zoom: 7.0,
          bearing: 0.0,
          tilt: 0.0
      ),
    );
  }
}

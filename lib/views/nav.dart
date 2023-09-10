import 'package:catenary/views/map.dart';
import 'package:flutter/material.dart';

class CatenaryNavView extends StatelessWidget {
  const CatenaryNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Row(
        children: [
          Icon(Icons.departure_board, size: 32),
          SizedBox(width: 8),
          Text('Catenary'),
        ],
      ),),
      body: const CatenaryMapView(),
    );
  }
}
import 'package:catenary/views/nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CatenaryApp());
}

class CatenaryApp extends StatelessWidget {
  const CatenaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catenary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const CatenaryNavView(),
    );
  }
}


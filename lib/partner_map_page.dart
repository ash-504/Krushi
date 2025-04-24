import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  final String pickup;
  final String drop;

  const MapPage({super.key, required this.pickup, required this.drop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delivery Map")),
      body: Center(
        child: Text("Pickup: $pickup\nDrop: $drop"),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:socdoc_flutter/Pages/DetailPage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Detail Page"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage()));
              }
            ),
            const Expanded(child: MapView())
          ]
        )
      )
    );
  }
}

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<StatefulWidget> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition tmpCoord = CameraPosition(
    target: LatLng(37.4905987, 126.9441426),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: tmpCoord,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      }
    );
  }
}
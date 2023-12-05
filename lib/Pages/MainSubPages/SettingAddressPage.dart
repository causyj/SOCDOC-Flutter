import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SettingAddressPage extends StatefulWidget {
  const SettingAddressPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingAddressPageState();
}

class _SettingAddressPageState extends State<SettingAddressPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition initCoord = CameraPosition(
    target: LatLng(37.4905987, 126.9441426),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    _determinePosition();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingAddressPage'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text("지도를 움직여 위치를 선택해주세요."),
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: initCoord,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                }
              )
            )
          ],
        ),
      )
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    await Geolocator.getCurrentPosition().then((cur) => {
      _moveCamera(cur.latitude, cur.longitude)
    });
  }

  Future<void> _moveCamera(lat, lng) async {
    CameraPosition newCoord = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 17,
    );

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(newCoord));
  }
}
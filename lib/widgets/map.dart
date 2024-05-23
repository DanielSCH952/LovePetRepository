import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

const mapBoxAccessToken =
    'pk.eyJ1IjoiZHNjaDAxNzIiLCJhIjoiY2x0djFkN2ptMWhwbDJrcXE0d2I0YTR6bSJ9.5qq17BdUaL_gcAn9zIeSAA';

class WgMap extends StatelessWidget {
  const WgMap({super.key});

  Future<LatLng> obtenerPosicionActual() async {
    Position posicionActual;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.unableToDetermine ||
        permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return generarCoordenadasAleatoriasRegion();
      }
    }
    posicionActual = await Geolocator.getCurrentPosition();
    return LatLng(posicionActual.latitude, posicionActual.longitude);
  }

  LatLng generarCoordenadasAleatoriasRegion() {
    double latitudMin = 19.789;
    double latitudMax = 19.827620;

    double longitudMin = -97.349;
    double longitudMax = -97.381926;
    return LatLng(
      Random().nextDouble() * (latitudMax - latitudMin) + latitudMin,
      Random().nextDouble() * (longitudMax - longitudMin) + longitudMin,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: obtenerPosicionActual(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          LatLng coordenadas = snapshot.data!;
          return FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 26,
              initialCenter: coordenadas,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(markers: [
                Marker(
                    point: coordenadas,
                    child: IconButton(
                      onPressed: () {
                        SmartDialog.showToast(snapshot.data.toString());
                      },
                      icon: const Icon(Icons.person_pin_circle),
                    ))
              ]),
              const RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                  ),
                ],
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

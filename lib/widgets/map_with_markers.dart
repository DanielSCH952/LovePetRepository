import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';

const String mapboxtoken =
    'pk.eyJ1IjoiZHNjaDAxNzIiLCJhIjoiY2x0djFkN2ptMWhwbDJrcXE0d2I0YTR6bSJ9.5qq17BdUaL_gcAn9zIeSAA';

class WgMapWithMarkes extends StatelessWidget {
  final LatLng ubicacionInicial;
  final double? zoomInicial;
  final List<AnimatedMarker>? listMarkers;

  const WgMapWithMarkes({
    super.key,
    required this.ubicacionInicial,
    this.zoomInicial = 17.5,
    this.listMarkers,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialRotation: 0.0,
        minZoom: 5,
        maxZoom: 26,
        applyPointerTranslucencyToLayers: true,
        initialZoom: zoomInicial!,
        initialCenter: ubicacionInicial,
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/dsch0172/cltv39pts00wk01pb6cza4qc2/tiles/256/{z}/{x}/{y}@2x?access_token={access_token}",
          additionalOptions: const {
            'access_token': mapboxtoken,
          },
        ),
        AnimatedMarkerLayer(
          markers: listMarkers ?? [],
        ),
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
}

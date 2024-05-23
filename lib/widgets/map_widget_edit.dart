import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:lovepet/widgets/custom_toast.dart';

const String mapboxtoken =
    'pk.eyJ1IjoiZHNjaDAxNzIiLCJhIjoiY2x0djFkN2ptMWhwbDJrcXE0d2I0YTR6bSJ9.5qq17BdUaL_gcAn9zIeSAA';

class WgMapaEdit extends StatefulWidget {
  final LatLng ubicacionInicial;
  final double? zoomInicial;
  final Function(TapPosition, LatLng)? tapFunction;
  const WgMapaEdit({
    super.key,
    required this.ubicacionInicial,
    this.zoomInicial = 17.5,
    this.tapFunction,
  });

  @override
  State<WgMapaEdit> createState() => _WgMapaEditState();
}

class _WgMapaEditState extends State<WgMapaEdit> with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _animatedMapController.mapController,
      options: MapOptions(
        initialRotation: 0.0,
        minZoom: 13,
        maxZoom: 31,
        applyPointerTranslucencyToLayers: true,
        initialZoom: widget.zoomInicial!,
        initialCenter: widget.ubicacionInicial,
        onTap: widget.tapFunction,
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
          markers: [
            AnimatedMarker(
              point: widget.ubicacionInicial,
              builder: (_, animation) {
                final size = 50.0 * animation.value;
                return IconButton(
                  onPressed: () {
                    SmartDialog.showToast(
                      '',
                      builder: (context) => WgCustomToast(
                        msg:
                            "Ubicacion: \n${widget.ubicacionInicial.latitude},${widget.ubicacionInicial.longitude}",
                        icon: const Icon(Icons.location_on_outlined),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.location_on,
                    size: size,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

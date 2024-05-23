import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:lovepet/widgets/custom_toast.dart';
const String mapboxtoken =
    'pk.eyJ1IjoiZHNjaDAxNzIiLCJhIjoiY2x0djFkN2ptMWhwbDJrcXE0d2I0YTR6bSJ9.5qq17BdUaL_gcAn9zIeSAA';

class WgMapa extends StatefulWidget {
  final LatLng ubicacionInicial;
  final double? zoomInicial;
  const WgMapa({
    super.key,
    required this.ubicacionInicial,
    this.zoomInicial = 17.5,
  });

  @override
  State<WgMapa> createState() => _WgMapaState();
}

class _WgMapaState extends State<WgMapa> with TickerProviderStateMixin {
  static const _useTransformerId = 'useTransformerId';
  late final _animatedMapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
  LatLng? ubicacionMarker;
  final bool _useTransformer = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _animatedMapController.mapController,
          options: MapOptions(
            initialRotation: 0.0,
            minZoom: 13,
            maxZoom: 31,
            applyPointerTranslucencyToLayers: true,
            initialZoom: widget.zoomInicial!,
            initialCenter: widget.ubicacionInicial,
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
        ),
        Positioned(
          top: 3,
          right: 2,
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(177, 255, 255, 255),
                ),
                child: IconButton(
                  onPressed: () {
                    _animatedMapController.animatedRotateFrom(
                      90,
                      customId: _useTransformer ? _useTransformerId : null,
                    );
                  },
                  tooltip: 'Rotate 90°',
                  icon: const Icon(
                    Icons.rotate_right,
                    size: 35,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(177, 255, 255, 255),
                ),
                child: IconButton(
                  onPressed: () {
                    _animatedMapController.animatedRotateFrom(
                      -90,
                      customId: _useTransformer ? _useTransformerId : null,
                    );
                  },
                  tooltip: 'Rotate -90°',
                  icon: const Icon(
                    Icons.rotate_left,
                    size: 35,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(177, 255, 255, 255),
                ),
                child: IconButton(
                  onPressed: () {
                    _animatedMapController.animatedZoomIn(
                      customId: _useTransformer ? _useTransformerId : null,
                    );
                  },
                  tooltip: 'Zoom in',
                  icon: const Icon(
                    Icons.zoom_in,
                    size: 35,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(177, 255, 255, 255),
                ),
                child: IconButton(
                  onPressed: () {
                    _animatedMapController.animatedZoomOut(
                      customId: _useTransformer ? _useTransformerId : null,
                    );
                  },
                  tooltip: 'Zoom out',
                  icon: const Icon(
                    Icons.zoom_out,
                    size: 35,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(177, 255, 255, 255),
                ),
                child: IconButton(
                  onPressed: () {
                    _animatedMapController.animateTo(
                      dest: widget.ubicacionInicial,
                      rotation: 0,
                      customId: _useTransformer ? _useTransformerId : null,
                    );
                  },
                  tooltip: 'Center',
                  icon: const Icon(
                    Icons.center_focus_strong,
                    size: 35,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

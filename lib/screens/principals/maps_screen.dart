import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:lovepet/services/services.dart';
import 'package:lovepet/widgets/map_with_markers.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleecciona el negocio a registrar'),
      ),
      body: FutureBuilder(
        future: obtenerPosicionActual(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            LatLng ubicacionActual =
                snapshot.data ?? const LatLng(19.5286225, -96.91136);
            return Container(
              width: double.infinity,
              height: 290,
              margin: const EdgeInsets.all(4.5),
              padding: const EdgeInsets.all(6.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: BorderSide.strokeAlignOutside,
                        blurStyle: BlurStyle.outer,
                        color: Theme.of(context).colorScheme.primary,
                        spreadRadius: 0.5)
                  ]),
              child: WgMapWithMarkes(
                ubicacionInicial: ubicacionActual,
                zoomInicial: 18.4,
              ),
            );
          }
          return const Center(
            child: Column(
              children: [Text("Cargando mapa"), CircularProgressIndicator()],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lovepet/widgets/wg/adopciones_container.dart';

class Adopciones extends StatefulWidget {
  const Adopciones({super.key});

  @override
  State<Adopciones> createState() => _AdopcionesState();
}

class _AdopcionesState extends State<Adopciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AdopcionesContainer(),
              AdopcionesContainer(),
              AdopcionesContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

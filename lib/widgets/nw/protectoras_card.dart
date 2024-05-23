import 'package:flutter/material.dart';
import 'package:lovepet/services/router.dart';
//import 'detalle_protectora_screen.dart';
import 'custom_card.dart';

class ProtectoraCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AnimateRouter $route = AnimateRouter();
    return CustomCard(
      title: 'Protectora de Animales',
      onPressed: () {
        Navigator.of(context)
            .pushAndRemoveUntil($route.createRoute("/login"), (route) => false);
      },
      leading: Image.asset('assets/protectora.jpg'),
    );
  }
}

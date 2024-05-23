import 'package:flutter/material.dart';
import 'package:lovepet/services/router.dart';
import 'custom_card.dart';

class EstablecimientoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AnimateRouter $route = AnimateRouter();
    return CustomCard(
      title: 'Establecimiento',
      onPressed: () {
        Navigator.of(context)
            .pushAndRemoveUntil($route.createRoute("/login"), (route) => false);
      },
      leading: Image.asset('assets/establecimiento.jpg'),
    );
  }
}

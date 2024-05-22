import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';

class PerfilAdopcion extends StatelessWidget {
  const PerfilAdopcion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil de Adopción',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Esta es la pantalla del perfil de adopción.'),
      ),
    );
  }
}

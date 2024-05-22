import 'package:flutter/material.dart';
import 'package:lovepet/widgets/wg/post_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        decoration: const BoxDecoration(
          color: Color(0xFFEDECF2),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PostContainer(
                imageUrl: 'assets/raccoon.png', // Ejemplo con imagen
                description: 'Descripción de la primera publicación',
              ),
              PostContainer(
                imageUrl: 'assets/login.png', // Ejemplo con imagen
                description: 'Descripción de la segunda publicación',
              ),
              PostContainer(
                imageUrl: 'assets/login.png', // Ejemplo con imagen
                description: 'Descripción de la tercera publicación',
              ),
              PostContainer(
                imageUrl: 'assets/login.png', // Ejemplo con imagen
                description: 'Descripción de la cuarta publicación',
              ),
              PostContainer(
                imageUrl: 'assets/login.png', // Ejemplo con imagen
                description: 'Descripción de la quinta publicación',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

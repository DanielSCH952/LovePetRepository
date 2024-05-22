import 'package:flutter/material.dart';
import 'package:lovepet/widgets/wg/consejo_container.dart';

class Consejos extends StatefulWidget {
  const Consejos({super.key});

  @override
  State<Consejos> createState() => _ConsejosState();
}

class _ConsejosState extends State<Consejos> {
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
              ConsejoContainer(
                imageUrl: 'assets/raccoon.png', // Ejemplo con imagen
                description: 'Descripción de la primera publicación Descripción de la primera publicación jhfujfkuvhkjvjhvhgjkgjfxdfchvjbkghdfszxgfchvjkghdfgsfzxcvhkghjdfhsfzxccvbnvnmdfzxcvbnvkgyftdfxgcvhku8454685jhghfgdghjkuytersfdghkjljkituygsfzxcjgkjhkjdhgsxcvjhlkjghfjdhg Descripción de la primera publicación jhfujfkuvhkjvjhvhgjkgjfxdfchvjbkghdfszxgfchvjkghdfgsfzxcvhkghjdfhsfzxccvbnvnmdfzxcvbnvkgyftdfxgcvhku8454685jhghfgdghjkuytersfdghkjljkituygsfzxcjgkjhkjdhgsxcvjhlkjghfjdhg Descripción de la primera publicación jhfujfkuvhkjvjhvhgjkgjfxdfchvjbkghdfszxgfchvjkghdfgsfzxcvhkghjdfhsfzxccvbnvnmdfzxcvbnvkgyftdfxgcvhku8454685jhghfgdghjkuytersfdghkjljkituygsfzxcjgkjhkjdhgsxcvjhlkjghfjdhg',
              ),
              ConsejoContainer(
                imageUrl: 'assets/raccoon.png', // Ejemplo con imagen
                description: 'Descripción de la primera publicación jhfujfkuvhkjvjhvhgjkgjfxdfchvjbkghdfszxgfchvjkghdfgsfzxcvhkghjdfhsfzxccvbnvnmdfzxcvbnvkgyftdfxgcvhku8454685jhghfgdghjkuytersfdghkjljkituygsfzxcjgkjhkjdhgsxcvjhlkjghfjdhg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
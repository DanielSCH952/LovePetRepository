import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';

class ExtravioContainer extends StatelessWidget {
  const ExtravioContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFEDECF2),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0.0, 4.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set container color
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        '¡SE BUSCA!',
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset('assets/raccoon.png',
                            width: 150.0, height: 150.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Nombre:',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Lúa',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Fecha de desaparición:',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '10 Jan 2024',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Última ubicación vista:',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Avenida Fray Andrés de Olmos, Rafael Lucio, Xalapa, Ver., Mexico',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Género:',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Femenina',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Descripción:',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Cruza de galgo, por lo mismo tiene complexión delgada, blanco con atigrado',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Contacto:',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'mich2382es@gmail.com',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

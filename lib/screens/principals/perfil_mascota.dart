import 'package:flutter/material.dart';

class PerfilMascota extends StatefulWidget {
  const PerfilMascota({super.key});

  @override
  State<PerfilMascota> createState() => _PerfilMascotaState();
}

class _PerfilMascotaState extends State<PerfilMascota> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen del animal con fondo
            Container(
              color: Colors.purple,
              child: Column(
                children: [
                  SizedBox(height: 60), // Espacio para el AppBar
                  Image.asset(
                    'assets/raccoon.png',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            // Contenedor con la información del animal y el dueño
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Milo Chihuahua',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'in Miami, Florida',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildInfoChip('Male', Colors.purple),
                      buildInfoChip('2 years', Colors.pink),
                      buildInfoChip('12 kg', Colors.green),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/raccoon.png'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jarvis Peppergracy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Owner',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Descripcion del animal Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        'ADOPT NOW',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoChip(String label, Color color) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lovepet/extension/sized_box_extension.dart';
import 'package:lovepet/services/router.dart';

class WelcomeLovePet extends StatelessWidget {
  const WelcomeLovePet({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimateRouter _router = AnimateRouter();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LovePet',
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(height: 10),
              // const Text(
              //   'Encuentra al compañero perfecto',
              //   style: TextStyle(
              //     fontWeight: FontWeight.normal,
              //     fontSize: 16,
              //     color: Colors.white,
              //   ),
              // ),
              // const SizedBox(height: 2),
              // const Text(
              //   'para tu mascota',
              //   style: TextStyle(
              //     fontWeight: FontWeight.normal,
              //     fontSize: 16,
              //     color: Colors.white,
              //   ),
              // ),
              // const SizedBox(height: 70),
              50.kH,
              ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Image.asset(
                  'assets/LogoVideo.gif',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              65.kH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        _router.createRoute("/login"),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  18.kW,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        "/registro",
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Crear Cuenta',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

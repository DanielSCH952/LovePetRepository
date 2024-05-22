import 'package:flutter/material.dart';
import 'package:lovepet/constants.dart';
import 'package:lovepet/extension/sized_box_extension.dart';
import 'package:lovepet/widgets/wg/rounded_buttonWelcome.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
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
              10.kH,
              const Text(
                'Encuentra al compañero perfecto',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              4.kH,
              const Text(
                'para tu mascota',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              70.kH,
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
              RoundedButtonWelcome(
                text: 'Iniciar Sesión',
                press: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/login", (route) => false);
                },
              ),
             20.kH,
              RoundedButtonWelcome(
                text: 'Crear cuenta',
                press: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/productos", (route) => false);
                },
              ),
            ],
          ),
        ),
      ),

      // body: Container(
      //   color: kPrimaryColor,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       const SizedBox(
      //         height: 35,
      //       ),
      //       Form(
      //         child: Column(
      //           children: [
      //             const RoundedInputField(
      //                 hintText: "Correo", icon: Icons.email),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             const RoundedPasswordField(),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //             RoundedButton(
      //               text: 'Iniciar Sesión',
      //               press: () {
      //                 Navigator.of(context).pushNamedAndRemoveUntil(
      //                     "/productos", (route) => false);
      //               },
      //             ),
      //             const SizedBox(
      //               height: 40,
      //             ),
      //             // UnderPart(
      //             //   title: "¿No tienes una cuenta?",
      //             //   navigatorText: "Regristrar",
      //             //   onTap: () {
      //             //     Navigator.push(
      //             //         context,
      //             //         MaterialPageRoute(
      //             //             builder: (context) => const SignUpScreen()));
      //             //   },
      //             // ),
      //             const SizedBox(
      //               height: 20,
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

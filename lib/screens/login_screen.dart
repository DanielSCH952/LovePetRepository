import 'package:flutter/material.dart';
import 'package:lovepet/components/under_part.dart';
import 'package:lovepet/constants.dart';
import 'package:lovepet/services/router.dart';

import '../widgets/wg/rounded_button.dart';
import '../widgets/wg/rounded_input_field.dart';
import '../widgets/wg/rounded_password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AnimateRouter $route = AnimateRouter();
    return Scaffold(
      body: Container(
        color: kSecundaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Iniciar Sesión',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //LabelsTitle(text: "Login"),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(200.0),
                        child: Image.asset(
                          'assets/LogoVideo.gif',
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Correo Electronico',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      const RoundedInputField(
                          hintText: "Ingresar correo", icon: Icons.email),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Contraseña',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      const RoundedPasswordField(),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                        text: 'Iniciar Sesión',
                        press: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              $route.createRoute("/main"), (route) => false);
                        },
                      ),
                      UnderPart(
                        title: "¿No tienes una cuenta?",
                        navigatorText: "Regristrar",
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const SignUpScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final txtCorreoController = TextEditingController();
    final txtPwdController = TextEditingController();
    bool showPassword = false;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8ED1B2), Color(0xFFFFFFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
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
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200.0),
                  child: Image.asset(
                    'assets/LogoVideo.gif',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text(
                      'Correo Electronico',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: txtCorreoController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                        suffixIcon: const Icon(Icons.mail),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blue.shade400),
                        ),
                      ),
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'Email requerido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Contraseña',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: !showPassword,
                      keyboardType: TextInputType.emailAddress,
                      controller: txtPwdController,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.blueGrey),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: showPassword
                              ? const Icon(Icons.visibility, size: 28)
                              : const Icon(Icons.visibility_off, size: 28),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.blue.shade400),
                        ),
                      ),
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'Contraseña requerido';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          "/main",
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        elevation: 5,
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          "/registro",
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Crear Cuenta',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lovepet/widgets/personal_widgets/formtextfield.dart';

class WgFormView4 extends StatefulWidget {
  const WgFormView4({
    super.key,
    required this.txtCorreoUsuarioController,
    required this.txtPwdUsuarioController,
    required this.txtPwdUsuarioCheckController,
  });
  final TextEditingController txtCorreoUsuarioController;
  final TextEditingController txtPwdUsuarioController;
  final TextEditingController txtPwdUsuarioCheckController;

  @override
  State<WgFormView4> createState() => _WgFormView4State();
}

class _WgFormView4State extends State<WgFormView4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              WgFormTextField(
                prop: 'Email',
                txtController: widget.txtCorreoUsuarioController,
                inputType: TextInputType.emailAddress,
                icono: const Icon(Icons.email),
              ),
              WgFormTextField(
                prop: 'Contraseña',
                txtController: widget.txtPwdUsuarioController,
                inputType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              WgFormTextField(
                prop: 'Repita Contraseña',
                txtController: widget.txtPwdUsuarioController,
                inputType: TextInputType.visiblePassword,
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lovepet/widgets/personal_widgets/formtextfield.dart';

class WgFormPage1 extends StatefulWidget {
  const WgFormPage1({
    super.key,
    required this.txtNombreUsuario,
    required this.txtApptUsuarioController,
    required this.txtApmtUsuarioController,
  });
  final TextEditingController txtNombreUsuario;
  final TextEditingController txtApptUsuarioController;
  final TextEditingController txtApmtUsuarioController;

  @override
  State<WgFormPage1> createState() => _WgFormView1State();
}

class _WgFormView1State extends State<WgFormPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WgFormTextField(
                  prop: 'Nombre',
                  errorMessage: "Falta completar este campo",
                  txtController: widget.txtNombreUsuario,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Apellido Paterno',
                  errorMessage: "Ingrese su apellido paterno, es requerido.",
                  txtController: widget.txtApptUsuarioController,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Apellido Materno',
                  errorMessage: "Ingrese su apellido materno, es requerido.",
                  txtController: widget.txtApmtUsuarioController,
                  inputType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

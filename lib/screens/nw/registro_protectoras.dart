import 'package:flutter/material.dart';
import 'package:lovepet/widgets/personal_widgets/formtextfield.dart';

class ProtectoraScreen extends StatefulWidget {
  const ProtectoraScreen({
    super.key,
    required this.txtNombreProtectora,
    required this.txtCorreoProtectora,
    required this.txtTelefonoProtectora,
    required this.txtDescripcionProtectora,
    required this.txthorariosAtencionProtectora,
    required this.txtDireccionProtectora,
  });

  final TextEditingController txtNombreProtectora;
  final TextEditingController txtCorreoProtectora;
  final TextEditingController txtTelefonoProtectora;
  final TextEditingController txtDescripcionProtectora;
  final TextEditingController txthorariosAtencionProtectora;
  final TextEditingController txtDireccionProtectora;
  @override
  State<ProtectoraScreen> createState() => _ProtectoraScreenState();
}

class _ProtectoraScreenState extends State<ProtectoraScreen> {
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
                  txtController: widget.txtNombreProtectora,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Correo',
                  errorMessage: "Ingrese su correo, es requerido.",
                  txtController: widget.txtCorreoProtectora,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Teléfonon',
                  errorMessage: "Ingrese su teléfono, es requerido.",
                  txtController: widget.txtTelefonoProtectora,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Descripción',
                  errorMessage: "Ingrese su descripcion, es requerido.",
                  txtController: widget.txtDescripcionProtectora,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Horario de atención',
                  errorMessage: "Ingrese su apellido materno, es requerido.",
                  txtController: widget.txthorariosAtencionProtectora,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Dirección',
                  errorMessage: "Ingrese su apellido materno, es requerido.",
                  txtController: widget.txtDireccionProtectora,
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

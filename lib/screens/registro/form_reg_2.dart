import 'package:flutter/material.dart';
import 'package:lovepet/widgets/personal_widgets/custom_dropdown2.dart';
import 'package:lovepet/widgets/personal_widgets/formtextfield.dart';

final lstGeneros = [
  {
    "genero": "Masculino",
    "idGenero": 1,
    "key": "M",
  },
  {
    "genero": "Femenino",
    "idGenero": 2,
    "key": "F",
  },
];

class WgFormView2 extends StatefulWidget {
  const WgFormView2({
    super.key,
    required this.txtEdadUsuarioController,
    required this.txtTelefonoController,
    required this.$changeGenero,
  });
  final TextEditingController txtEdadUsuarioController;
  final TextEditingController txtTelefonoController;
  final void Function(String?) $changeGenero;

  @override
  State<WgFormView2> createState() => _WgFormView2State();
}

class _WgFormView2State extends State<WgFormView2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                WgFormTextField(
                  prop: 'Edad',
                  errorMessage: "La edad es requerida",
                  txtController: widget.txtEdadUsuarioController,
                  inputType: TextInputType.number,
                ),
                WgCustomDropdown1(
                  $titulo: "Género",
                  $placeholder: "Selecciona tu género",
                  $nullErrorMessage: "Complete el campo",
                  $items: lstGeneros.map((e) => e["genero"] as String).toList(),
                  $onChanged: widget.$changeGenero,
                ),
                WgFormTextField(
                  prop: 'Telefono',
                  errorMessage: "Necesita registrar su numero de telefono",
                  txtController: widget.txtTelefonoController,
                  inputType: TextInputType.phone,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

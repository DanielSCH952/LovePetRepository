import 'package:flutter/material.dart';
import 'package:lovepet/widgets/personal_widgets/formtextfield.dart';

class MascotaScreen extends StatefulWidget {
  const MascotaScreen({
    super.key,
    required this.txtPropietario,
    required this.txtNombreMascota,
    required this.txtFechaNacimiento,
    required this.txtSexoMascota,
    required this.txtColorPelaje,
    required this.txtPesoMascota,
    required this.txtTamanioMascota,
    required this.txtRazaMascota,
    required this.txtCondicionReproductiva,
    required this.txtMezclasMascota,
    required this.txtImagenesMascota,
    required this.txtPublicacionTb,
  });

  final TextEditingController txtPropietario;
  final TextEditingController txtNombreMascota;
  final TextEditingController txtFechaNacimiento;
  final TextEditingController txtSexoMascota;
  final TextEditingController txtColorPelaje;
  final TextEditingController txtPesoMascota;
  final TextEditingController txtTamanioMascota;
  final TextEditingController txtRazaMascota;
  final TextEditingController txtCondicionReproductiva;
  final TextEditingController txtMezclasMascota;
  final TextEditingController txtImagenesMascota;
  final TextEditingController txtPublicacionTb;

  @override
  State<MascotaScreen> createState() => _MascotaScreenState();
}

class _MascotaScreenState extends State<MascotaScreen> {
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
                  prop: 'Propietario',
                  errorMessage: "Falta completar este campo",
                  txtController: widget.txtPropietario,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Nombre de la mascota',
                  errorMessage:
                      "Ingrese el nombre de la mascota, es requerido.",
                  txtController: widget.txtNombreMascota,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Fecha de nacimiento',
                  errorMessage: "Ingrese la fecha de nacimiento, es requerido.",
                  txtController: widget.txtFechaNacimiento,
                  inputType: TextInputType.datetime,
                ),
                WgFormTextField(
                  prop: 'Sexo',
                  errorMessage: "Ingrese el sexo, es requerido.",
                  txtController: widget.txtSexoMascota,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Color del pelaje',
                  errorMessage: "Ingrese el color del pelaje, es requerido.",
                  txtController: widget.txtColorPelaje,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Peso',
                  errorMessage: "Ingrese el peso, es requerido.",
                  txtController: widget.txtPesoMascota,
                  inputType: TextInputType.number,
                ),
                WgFormTextField(
                  prop: 'Tamaño',
                  errorMessage: "Ingrese el tamaño, es requerido.",
                  txtController: widget.txtTamanioMascota,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Raza',
                  errorMessage: "Ingrese la raza, es requerido.",
                  txtController: widget.txtRazaMascota,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Condición Reproductiva',
                  errorMessage:
                      "Ingrese la condición reproductiva, es requerido.",
                  txtController: widget.txtCondicionReproductiva,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Mezclas',
                  errorMessage: "Ingrese las mezclas, es requerido.",
                  txtController: widget.txtMezclasMascota,
                  inputType: TextInputType.text,
                ),
                WgFormTextField(
                  prop: 'Imágenes de la mascota',
                  errorMessage:
                      "Ingrese las imágenes de la mascota, es requerido.",
                  txtController: widget.txtImagenesMascota,
                  inputType: TextInputType.url,
                ),
                WgFormTextField(
                  prop: 'Publicación en la base de datos',
                  errorMessage:
                      "Ingrese la publicación en la base de datos, es requerido.",
                  txtController: widget.txtPublicacionTb,
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

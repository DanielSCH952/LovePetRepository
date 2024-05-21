import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lovepet/widgets/card_image.dart';
import 'package:lovepet/widgets/custom_dropdown2.dart';
import 'package:lovepet/widgets/formtextfield.dart';
import 'package:lovepet/widgets/picker_image.dart';
import 'package:table_calendar/table_calendar.dart';

class PetAccountRegistrationPage extends StatefulWidget {
  const PetAccountRegistrationPage({super.key});

  @override
  State<PetAccountRegistrationPage> createState() =>
      _AccountRegistrationPageState();
}

class _AccountRegistrationPageState extends State<PetAccountRegistrationPage> {
  final formKey = GlobalKey<FormState>();
  int step = 1;

  //Datos usuarario
  final txtNombreUsuario = TextEditingController();
  final txtApptUsuarioController = TextEditingController();
  final txtApmtUsuarioController = TextEditingController();
  final txtEdadUsuarioController = TextEditingController();
  final txtCorreoUsuarioController = TextEditingController();
  final txtPwdUsuarioController = TextEditingController();
  final txtPwdUsuarioCheckController = TextEditingController();
  String? generoUsuario;

  //Datos Mascota
  final txtNombreMascotaController = TextEditingController();
  String? tipoMascota;
  String? especieMascota;
  String? generoMascota;
  final txtEdadMascotaController = TextEditingController();
  String? tamanoMascota;
  final txtPesoMascotaController = TextEditingController();
  DateTime? fechaMascota;
  File? imagenMascota;

  bool showPassword = false;
  bool personalDataValidated = false;
  bool petDataValidated = false;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _currentDay = DateTime.now();
  DateTime? _selectedDay;

  bool isUserDataValidated() {
    return txtNombreUsuario.text.isNotEmpty &&
        txtApptUsuarioController.text.isNotEmpty &&
        txtApmtUsuarioController.text.isNotEmpty &&
        txtCorreoUsuarioController.text.isNotEmpty &&
        txtPwdUsuarioController.text.isNotEmpty;
  }

  bool isPersonalDataValidated() {
    return txtNombreUsuario.text.isNotEmpty &&
        txtApptUsuarioController.text.isNotEmpty &&
        txtApmtUsuarioController.text.isNotEmpty &&
        txtEdadMascotaController.text.isNotEmpty &&
        txtCorreoUsuarioController.text.isNotEmpty &&
        txtPwdUsuarioController.text.isNotEmpty;
  }

  Widget getWidgetStep(int step) {
    switch (step) {
      case 1:
        return wgFormPersonalData1();
      case 2:
        return wgFormPersonalData2();
      case 3:
        return wgFormPetData();
      case 4:
        return wgFormPetData2();
      case 5:
        return wgImagenFormData();
      default:
        return wgFormPersonalData1();
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: getWidgetStep(step)),
          ),
        ),
      ),
    );
  }

  Widget wgFormPersonalData1() {
    return Column(
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
            WgFormTextField(
              prop: 'Nombre',
              errorMessage: "El nombre es requerido",
              txtController: txtNombreUsuario,
              inputType: TextInputType.text,
            ),
            WgFormTextField(
              prop: 'Apellido Paterno',
              errorMessage: "El apellido paterno es requerido",
              txtController: txtApptUsuarioController,
              inputType: TextInputType.text,
            ),
            WgFormTextField(
              prop: 'Apellido Materno',
              errorMessage: "El apellido materno es requerido",
              txtController: txtApmtUsuarioController,
              inputType: TextInputType.text,
            ),
            WgFormTextField(
              prop: 'Edad',
              errorMessage: "La edad es requerida",
              txtController: txtEdadUsuarioController,
              inputType: TextInputType.number,
            ),
            WgCustomDropdown1(
              $titulo: "Género",
              $placeholder: "Selecciona tu género",
              $nullErrorMessage: "Complete el campo",
              $items: const [
                "Masculino",
                "Femenino",
              ],
              $onChanged: (value) {
                setState(() {
                  generoUsuario = value;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  "/",
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                elevation: 5,
              ),
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // if (formKey.currentState!.validate()) {
                //   formKey.currentState!.save();
                //   setState(() {
                //     personalDataValidated = !personalDataValidated;
                //   });
                // }
                setState(() {
                  step = step + 1;
                });
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                elevation: 5,
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget wgFormPersonalData2() {
    return Column(
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
            WgFormTextField(
              prop: 'Email',
              txtController: txtCorreoUsuarioController,
              inputType: TextInputType.emailAddress,
              icono: const Icon(Icons.email),
            ),
            WgFormTextField(
              prop: 'Contraseña',
              txtController: txtPwdUsuarioController,
              inputType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            WgFormTextField(
              prop: 'Repita Contraseña',
              txtController: txtPwdUsuarioCheckController,
              inputType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      step = step - 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 15),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      step = step + 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 15),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Siguiente',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget wgFormPetData() {
    return Column(
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
            WgFormTextField(
              prop: 'Nombre de tu mascota',
              txtController: txtNombreMascotaController,
              inputType: TextInputType.text,
              icono: const Icon(Icons.question_mark),
            ),
            WgCustomDropdown1(
              $titulo: "Tipo Mascota",
              $placeholder: "Selecciona un tipo de mascota",
              $nullErrorMessage: "Por favor seleccione un tipo de mascota",
              $items: const [
                "Perro",
                "Gato",
              ],
              $onChanged: (value) {
                setState(() {
                  tipoMascota = value;
                });
              },
            ),
            WgCustomDropdown1(
              $titulo: "Raza/especie",
              $placeholder: "Selecciona un tipo de raza o especie",
              $nullErrorMessage: "Complete el campo",
              $items: const ["Chihuahua", "Fox Terrier", "Pomerania"],
              $onChanged: (valor) {
                setState(() {
                  especieMascota = valor;
                });
              },
            ),
            WgCustomDropdown1(
              $titulo: "Género",
              $placeholder: "Selecciona el género de su mascota",
              $nullErrorMessage: "Complete el campo",
              $items: const ["Masculino", "Femenino"],
              $onChanged: (value) {
                setState(() {
                  generoMascota = value;
                });
              },
            ),
            WgFormTextField(
              prop: 'Edad',
              txtController: txtEdadMascotaController,
              inputType: TextInputType.number,
              icono: const Icon(
                Icons.featured_play_list_outlined,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  step = step - 1;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                elevation: 5,
              ),
              child: const Text(
                'Regresar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  step = step + 1;
                });
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                elevation: 5,
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget wgFormPetData2() {
    return Column(
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
            wgCalendarSelectDatePet(),
            WgCustomDropdown1(
              $titulo: "Tamaño",
              $placeholder: "Seleccione el tamaño de su mascota",
              $items: ["Miniatura", "Pequeño", "Mediano", "Grande"],
              $onChanged: (value) {
                setState(() {
                  tamanoMascota = value;
                });
              },
            ),
            WgFormTextField(
              prop: "Peso",
              txtController: txtPesoMascotaController,
              inputType: TextInputType.number,
            ),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  step = step - 1;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                elevation: 5,
              ),
              child: const Text(
                'Regresar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  step = step + 1;
                });
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                elevation: 5,
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget wgImagenFormData() {
    return Column(
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
        imagenMascota != null
            ? WgCardImage(
                image: imagenMascota!,
                changeImage: () async => {
                  SmartDialog.show(
                    alignment: Alignment.lerp(
                      Alignment.topCenter,
                      Alignment.center,
                      .48,
                    ),
                    backDismiss: false,
                    builder: (context) {
                      return Container(
                        width: 320,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.4),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WgPickerImage(
                                showImageIcon: false,
                                captureImgCamera: () async {
                                  await seleccionarImagenCamara();
                                  SmartDialog.dismiss();
                                },
                                captureImgGalery: () async {
                                  await seleccionarImagenGaleria();
                                  SmartDialog.dismiss();
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                },
                cropImage: () async => await recortarImagen(),
              )
            : WgPickerImage(
                captureImgCamera: () async => await seleccionarImagenCamara(),
                captureImgGalery: () async => await seleccionarImagenGaleria(),
              ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  step = step - 1;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                elevation: 5,
              ),
              child: const Text(
                'Regresar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                elevation: 5,
              ),
              child: const Text(
                'Finalizar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget wgCalendarSelectDatePet() {
    return Column(
      children: [
        Text(
          "Fecha de Nacimiento",
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TableCalendar(
          firstDay: DateTime.utc(2018, 10, 16),
          lastDay: DateTime.utc(2025, 3, 14),
          focusedDay: _selectedDay ?? DateTime.now(),
          currentDay: _currentDay,
          calendarFormat: _calendarFormat,
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(255, 138, 223, 184),
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Color(0xFF9FA8DA),
              shape: BoxShape.circle,
            ),
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDay = selectedDay;
                _currentDay = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _currentDay = focusedDay;
          },
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Future seleccionarImagenGaleria() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture == null) return null;
    setState(() {
      imagenMascota = File(picture.path);
    });
  }

  Future seleccionarImagenCamara() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picture == null) return null;
    setState(() {
      imagenMascota = File(picture.path);
    });
  }

  Future recortarImagen() async {
    var imageCropped = await ImageCropper().cropImage(
      sourcePath: imagenMascota!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: const Color.fromARGB(238, 164, 11, 11),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          showCropGrid: true,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    if (imageCropped == null) return null;
    setState(() {
      imagenMascota = File(imageCropped.path);
    });
  }
}

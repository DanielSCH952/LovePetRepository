import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lovepet/models/estado.dart';
import 'package:lovepet/models/municipio.dart';

List<Map<String, dynamic>> _estadosDeMexico = [
  {'idEstado': 1, 'estado': 'Aguascalientes'},
  {'idEstado': 2, 'estado': 'Baja California'},
  {'idEstado': 3, 'estado': 'Baja California Sur'},
  {'idEstado': 4, 'estado': 'Campeche'},
  {'idEstado': 5, 'estado': 'Chiapas'},
  {'idEstado': 6, 'estado': 'Chihuahua'},
  {'idEstado': 7, 'estado': 'Ciudad de México'},
  {'idEstado': 8, 'estado': 'Coahuila'},
  {'idEstado': 9, 'estado': 'Colima'},
  {'idEstado': 10, 'estado': 'Durango'},
  {'idEstado': 11, 'estado': 'Guanajuato'},
  {'idEstado': 12, 'estado': 'Guerrero'},
  {'idEstado': 13, 'estado': 'Hidalgo'},
  {'idEstado': 14, 'estado': 'Jalisco'},
  {'idEstado': 15, 'estado': 'México'},
  {'idEstado': 16, 'estado': 'Michoacán'},
  {'idEstado': 17, 'estado': 'Morelos'},
  {'idEstado': 18, 'estado': 'Nayarit'},
  {'idEstado': 19, 'estado': 'Nuevo León'},
  {'idEstado': 20, 'estado': 'Oaxaca'},
  {'idEstado': 21, 'estado': 'Puebla'},
  {'idEstado': 22, 'estado': 'Querétaro'},
  {'idEstado': 23, 'estado': 'Quintana Roo'},
  {'idEstado': 24, 'estado': 'San Luis Potosí'},
  {'idEstado': 25, 'estado': 'Sinaloa'},
  {'idEstado': 26, 'estado': 'Sonora'},
  {'idEstado': 27, 'estado': 'Tabasco'},
  {'idEstado': 28, 'estado': 'Tamaulipas'},
  {'idEstado': 29, 'estado': 'Tlaxcala'},
  {'idEstado': 30, 'estado': 'Veracruz'},
  {'idEstado': 31, 'estado': 'Yucatán'},
  {'idEstado': 32, 'estado': 'Zacatecas'},
];

List<Map<String, dynamic>> _municipiosDePuebla = [
  {'idMunicipio': 1, 'idEstado': 21, 'municipio': 'Chignahuapan'},
  {'idMunicipio': 2, 'idEstado': 21, 'municipio': 'Teziutlán'},
  {'idMunicipio': 3, 'idEstado': 21, 'municipio': 'Xiutetelco'},
  {'idMunicipio': 4, 'idEstado': 21, 'municipio': 'Cholula'},
  {'idMunicipio': 5, 'idEstado': 21, 'municipio': 'Atlixco'},
  {'idMunicipio': 6, 'idEstado': 21, 'municipio': 'Izúcar de Matamoros'},
  {'idMunicipio': 7, 'idEstado': 21, 'municipio': 'San Martín Texmelucan'},
  {'idMunicipio': 8, 'idEstado': 21, 'municipio': 'San Pedro Cholula'},
  {'idMunicipio': 9, 'idEstado': 21, 'municipio': 'San Andrés Cholula'},
  {'idMunicipio': 10, 'idEstado': 21, 'municipio': 'Huauchinango'},
  {'idMunicipio': 11, 'idEstado': 21, 'municipio': 'Zacatlán'},
  {'idMunicipio': 12, 'idEstado': 21, 'municipio': 'Tehuacán'},
  {'idMunicipio': 13, 'idEstado': 21, 'municipio': 'Puebla'},
  {'idMunicipio': 14, 'idEstado': 21, 'municipio': 'Amozoc'},
  {'idMunicipio': 15, 'idEstado': 21, 'municipio': 'Chinaugtla'},
  // Municipios de Veracruz
  {'idMunicipio': 1, 'idEstado': 30, 'municipio': 'Xalapa'},
  {'idMunicipio': 2, 'idEstado': 30, 'municipio': 'Veracruz'},
  {'idMunicipio': 3, 'idEstado': 30, 'municipio': 'Coatzacoalcos'},
  {'idMunicipio': 4, 'idEstado': 30, 'municipio': 'Orizaba'},
  {'idMunicipio': 5, 'idEstado': 30, 'municipio': 'Poza Rica'},
  {'idMunicipio': 6, 'idEstado': 30, 'municipio': 'Córdoba'},
  {'idMunicipio': 7, 'idEstado': 30, 'municipio': 'Minatitlán'},
  {'idMunicipio': 8, 'idEstado': 30, 'municipio': 'Tuxpan'},
  {'idMunicipio': 9, 'idEstado': 30, 'municipio': 'Boca del Río'},
  {'idMunicipio': 10, 'idEstado': 30, 'municipio': 'San Andrés Tuxtla'},

  // Municipios de Oaxaca
  {'idMunicipio': 11, 'idEstado': 20, 'municipio': 'Oaxaca de Juárez'},
  {'idMunicipio': 12, 'idEstado': 20, 'municipio': 'Salina Cruz'},
  {'idMunicipio': 13, 'idEstado': 20, 'municipio': 'Juchitán de Zaragoza'},
  {'idMunicipio': 14, 'idEstado': 20, 'municipio': 'Santa Cruz Xoxocotlán'},
  {
    'idMunicipio': 15,
    'idEstado': 20,
    'municipio': 'San Juan Bautista Tuxtepec'
  },
  {'idMunicipio': 16, 'idEstado': 20, 'municipio': 'Huajuapan de León'},
  {'idMunicipio': 17, 'idEstado': 20, 'municipio': 'Tehuantepec'},
  {'idMunicipio': 18, 'idEstado': 20, 'municipio': 'Puerto Escondido'},
  {
    'idMunicipio': 19,
    'idEstado': 20,
    'municipio': 'Miahuatlán de Porfirio Díaz'
  },
  {'idMunicipio': 20, 'idEstado': 20, 'municipio': 'Santa María Huatulco'},
];
Future<File?> seleccionarImagenGaleria() async {
  final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (picture == null) return null;
  return File(picture.path);
}

Future<File?> seleccionarImagenCamara() async {
  final picture = await ImagePicker().pickImage(source: ImageSource.camera);
  if (picture == null) return null;
  return File(picture.path);
}

Future<File?> recortarImagen(BuildContext $contexto, File $image) async {
  var imageCropped = await ImageCropper().cropImage(
    sourcePath: $image.path,
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
        context: $contexto,
      ),
    ],
    aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
  );
  if (imageCropped == null) return null;
  return File(imageCropped.path);
}

Future<List<Estado>> getEstadosList() async {
  await Future.delayed(
    const Duration(
      seconds: 2,
      milliseconds: 30,
    ),
  );
  return _estadosDeMexico.map((e) => Estado.fromJson(e)).toList();
}

Future<List<Municipio>> getMunicipiosList() async {
  await Future.delayed(
    const Duration(
      seconds: 2,
      milliseconds: 30,
    ),
  );
  return _municipiosDePuebla.map((e) => Municipio.fromJson(e)).toList();
}

Future<List<Municipio>> getMunicipiosFromIdEstado(int? id) async {
  await Future.delayed(
    const Duration(
      seconds: 2,
      milliseconds: 30,
    ),
  );
  if (id == null) return List.empty();
  final lst = _municipiosDePuebla.map((e) => Municipio.fromJson(e)).toList();
  return lst.where((m) => m.idEstado == id).toList();
}

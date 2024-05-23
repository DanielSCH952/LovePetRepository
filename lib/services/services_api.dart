import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lovepet/models/mascota.dart';
import 'package:lovepet/models/custom_response.dart';

class ServicesApi {
  final String urlAPI = "http://192.168.1.73:84";
  final Dio $services = Dio();

  Future<Map<String, dynamic>?> registroMascota(Mascota m) async {
    final userForm = FormData.fromMap({
      "nombre": m.nombre,
      "fenchaNacimiento": m.fechaNacimiento,
      "sexo": m.sexo,
      "colorPelaje": m.colorPelaje,
      "peso": m.peso,
      "tamano": m.tamano,
      "imagen": m.image,
      "idRaza": m.idRaza,
      "idPropietario": m.idPropietario,
    });

    try {
      final $responseAPI = await $services.post("$urlAPI/", data: userForm);
      final $dataResponseAPI =
          json.decode($responseAPI.data) as Map<String, dynamic>;

      return $dataResponseAPI;
    } catch (e) {
      return null;
    }
  }
}

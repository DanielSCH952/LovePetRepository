import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lovepet/models/custom_response.dart';
import 'package:lovepet/models/direccion.dart';
import 'package:lovepet/services/services_api.dart';

class Usuario {
  int? id;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  int edad;
  String? telefono;
  String? genero;
  String correo;
  String? password;
  String? imagen;
  Direccion? direccion;
  Usuario({
    this.id,
    this.direccion,
    this.password,
    required this.nombre,
    required this.edad,
    required this.correo,
    required this.imagen,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
  });

  factory Usuario.fromJson(Map<String, dynamic> $json) {
    return Usuario(
      id: int.parse($json['id']),
      nombre: $json['nombre'],
      apellidoPaterno: $json['apellidoPaterno'],
      apellidoMaterno: $json['apellidoMaterno'],
      correo: $json['correo'],
      edad: int.parse($json['edad']),
      imagen: $json['imageUrl'],
      direccion: Direccion.fromJson($json['direccion']),
    );
  }

  Future<ResponseAPI> saveToDB(File img) async {
    ServicesApi clientApi = ServicesApi();
    final userForm = FormData.fromMap({
      "nombre": nombre,
      "apellidoPaterno": apellidoPaterno,
      "apellidoMaterno": apellidoMaterno,
      "edad": edad,
      "telefono": telefono,
      "genero": genero,
      "correo": correo,
      "password": password,
      "dirección": direccion?.toJson(),
      "imagen": MultipartFile.fromFile(img.path),
    });

    try {
      final $responseAPI =
          await clientApi.$services.post("${clientApi.urlAPI}/", data: userForm);
      final $dataResponseAPI =
          json.decode($responseAPI.data) as Map<String, dynamic>;

      return ResponseAPI.fromJSON($dataResponseAPI);
    } catch (e) {
      return ResponseAPI(
        message: "Error no se pudo conectar a la base de datos",
        statusCode: 500,
      );
    }
  }

  Future<ResponseAPI> getAuthentication() async {
    ServicesApi clientApi = ServicesApi();
    final userForm = FormData.fromMap({
      "correo": correo,
      "password": password,
    });
    try {
      final $responseAPI = await clientApi.$services
          .post("${clientApi.urlAPI}/login", data: userForm);
      final $dataResponseAPI =
          json.decode($responseAPI.data) as Map<String, dynamic>;
      return ResponseAPI.fromJSON($dataResponseAPI);
    } catch (e) {
      return ResponseAPI(
        message: "Error no se pudo conectar a la base de datos",
        statusCode: 500,
      );
    }
  }
}

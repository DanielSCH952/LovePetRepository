import 'dart:convert';
import 'dart:ffi';

import 'package:lovepet/models/publicacion.dart';

class Mascota {
  int? id;
  String nombre;
  DateTime fechaNacimiento;
  String sexo;
  String colorPelaje;
  Float peso;
  String tamano;
  String image;
  String? raza;
  int? idRaza;
  int? idPropietario;
  List<String>? imagenes;
  List<Publicacion>? publicaciones;

  Mascota({
    required this.id,
    required this.nombre,
    required this.fechaNacimiento,
    required this.sexo,
    required this.colorPelaje,
    required this.peso,
    required this.tamano,
    required this.image,
    required this.idRaza,
    required this.raza,
    required this.idPropietario,
    this.imagenes,
    this.publicaciones,
  });
  factory Mascota.fromRawJson(String str) => Mascota.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mascota.fromJson(Map<String, dynamic> json) => Mascota(
        id: json["id"],
        nombre: json["nombre"],
        fechaNacimiento: json["fenchaNacimiento"],
        sexo: json["sexo"],
        colorPelaje: json["colorPelaje"],
        peso: json["peso"]?.toDouble(),
        tamano: json["tamano"],
        image: json["image"],
        idRaza: json["idRaza"],
        raza: json["Raza"],
        idPropietario: json["idPropietario"],
        // imagenes: List<dynamic>.from(json["imagenes"].map((x) => x)),
        // publicaciones: List<dynamic>.from(json["publicaciones"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fenchaNacimiento": fechaNacimiento,
        "sexo": sexo,
        "colorPelaje": colorPelaje,
        "peso": peso,
        "tamano": tamano,
        "image": image,
        "idRaza": idRaza,
        "Raza": raza,
        "idPropietario": idPropietario,
        // "imagenes": List<dynamic>.from(imagenes.map((x) => x)),
        // "publicaciones": List<dynamic>.from(publicaciones.map((x) => x)),
      };
}

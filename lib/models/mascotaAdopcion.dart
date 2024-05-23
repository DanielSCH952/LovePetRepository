import 'dart:convert';

import 'package:lovepet/models/municipio.dart';

class MascotaAdopcion {
  int id;
  String nombre;
  String fenchaNacimiento;
  String sexo;
  String colorPelaje;
  double peso;
  String tamano;
  int idRaza;
  int condicionReproductiva;
  String raza;
  Municipio asociacion;
  List<dynamic> imagenesMascotaAdopcion;
  List<dynamic> mezclasRazas;
  List<dynamic> extravios;

  MascotaAdopcion({
    required this.id,
    required this.nombre,
    required this.fenchaNacimiento,
    required this.sexo,
    required this.colorPelaje,
    required this.peso,
    required this.tamano,
    required this.idRaza,
    required this.condicionReproductiva,
    required this.raza,
    required this.asociacion,
    required this.imagenesMascotaAdopcion,
    required this.mezclasRazas,
    required this.extravios,
  });

  factory MascotaAdopcion.fromRawJson(String str) =>
      MascotaAdopcion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MascotaAdopcion.fromJson(Map<String, dynamic> json) =>
      MascotaAdopcion(
        id: json["id"],
        nombre: json["nombre"],
        fenchaNacimiento: json["fenchaNacimiento"],
        sexo: json["sexo"],
        colorPelaje: json["colorPelaje"],
        peso: json["peso"]?.toDouble(),
        tamano: json["tamano"],
        idRaza: json["idRaza"],
        condicionReproductiva: json["condicionReproductiva"],
        raza: json["Raza"],
        asociacion: Municipio.fromJson(json["Asociacion"]),
        imagenesMascotaAdopcion:
            List<dynamic>.from(json["ImagenesMascotaAdopcion"].map((x) => x)),
        mezclasRazas: List<dynamic>.from(json["MezclasRazas"].map((x) => x)),
        extravios: List<dynamic>.from(json["Extravios"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fenchaNacimiento": fenchaNacimiento,
        "sexo": sexo,
        "colorPelaje": colorPelaje,
        "peso": peso,
        "tamano": tamano,
        "idRaza": idRaza,
        "condicionReproductiva": condicionReproductiva,
        "Raza": raza,
        // "Asociacion": asociacion.toJson(),
        "ImagenesMascotaAdopcion":
            List<dynamic>.from(imagenesMascotaAdopcion.map((x) => x)),
        "MezclasRazas": List<dynamic>.from(mezclasRazas.map((x) => x)),
        "Extravios": List<dynamic>.from(extravios.map((x) => x)),
      };
}

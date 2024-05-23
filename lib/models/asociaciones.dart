import 'dart:convert';

import 'package:lovepet/models/municipio.dart';

class AsociacionesProtectoras {
  int id;
  String nombre;
  String correo;
  String telefono;
  String descripcion;
  String horariosAtencion;
  double idDireccion;
  String imagen;
  Municipio direccion;
  List<dynamic> imagenesAsociaciones;
  List<dynamic> mascotaAdopcion;

  AsociacionesProtectoras({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.telefono,
    required this.descripcion,
    required this.horariosAtencion,
    required this.idDireccion,
    required this.imagen,
    required this.direccion,
    required this.imagenesAsociaciones,
    required this.mascotaAdopcion,
  });

  factory AsociacionesProtectoras.fromRawJson(String str) =>
      AsociacionesProtectoras.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AsociacionesProtectoras.fromJson(Map<String, dynamic> json) =>
      AsociacionesProtectoras(
        id: json["id"],
        nombre: json["nombre"],
        correo: json["correo"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        horariosAtencion: json["horariosAtencion"],
        idDireccion: json["idDireccion"]?.toDouble(),
        imagen: json["imagen"],
        direccion: Municipio.fromJson(json["Direccion"]),
        imagenesAsociaciones:
            List<dynamic>.from(json["ImagenesAsociaciones"].map((x) => x)),
        mascotaAdopcion:
            List<dynamic>.from(json["MascotaAdopcion"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "correo": correo,
        "telefono": telefono,
        "descripcion": descripcion,
        "horariosAtencion": horariosAtencion,
        "idDireccion": idDireccion,
        "imagen": imagen,
        // "Direccion": direccion.toJson(),
        "ImagenesAsociaciones":
            List<dynamic>.from(imagenesAsociaciones.map((x) => x)),
        "MascotaAdopcion": List<dynamic>.from(mascotaAdopcion.map((x) => x)),
      };
}

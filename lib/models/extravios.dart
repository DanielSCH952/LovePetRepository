import 'dart:convert';

class Extravios {
  int id;
  String fecha;
  String ultimaUbicacion;
  double descripcion;
  int contacto;
  String idMascota;
  String mascota;
  List<dynamic> imagenesExtraviosTb;

  Extravios({
    required this.id,
    required this.fecha,
    required this.ultimaUbicacion,
    required this.descripcion,
    required this.contacto,
    required this.idMascota,
    required this.mascota,
    required this.imagenesExtraviosTb,
  });

  factory Extravios.fromRawJson(String str) =>
      Extravios.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Extravios.fromJson(Map<String, dynamic> json) => Extravios(
        id: json["id"],
        fecha: json["fecha"],
        ultimaUbicacion: json["ultimaUbicacion"],
        descripcion: json["descripcion"]?.toDouble(),
        contacto: json["contacto"],
        idMascota: json["idMascota"],
        mascota: json["Mascota"],
        imagenesExtraviosTb:
            List<dynamic>.from(json["ImagenesExtraviosTb"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha": fecha,
        "ultimaUbicacion": ultimaUbicacion,
        "descripcion": descripcion,
        "contacto": contacto,
        "idMascota": idMascota,
        "Mascota": mascota,
        "ImagenesExtraviosTb":
            List<dynamic>.from(imagenesExtraviosTb.map((x) => x)),
      };
}

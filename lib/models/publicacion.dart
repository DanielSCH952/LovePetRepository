import 'dart:convert';

class Publicacion {
  int id;
  String descripcion;
  String tipo;
  double idUsuario;
  int idMascota;
  String usuario;
  String mascota;

  Publicacion({
    required this.id,
    required this.descripcion,
    required this.tipo,
    required this.idUsuario,
    required this.idMascota,
    required this.usuario,
    required this.mascota,
  });

  factory Publicacion.fromRawJson(String str) =>
      Publicacion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Publicacion.fromJson(Map<String, dynamic> json) => Publicacion(
        id: json["id"],
        descripcion: json["descripcion"],
        tipo: json["tipo"],
        idUsuario: json["idUsuario"]?.toDouble(),
        idMascota: json["idMascota"],
        usuario: json["Usuario"],
        mascota: json["Mascota"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "tipo": tipo,
        "idUsuario": idUsuario,
        "idMascota": idMascota,
        "Usuario": usuario,
        "Mascota": mascota,
      };
}

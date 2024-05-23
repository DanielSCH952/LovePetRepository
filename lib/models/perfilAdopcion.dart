import 'dart:convert';

import 'package:lovepet/models/municipio.dart';

class PerfilAdopcion {
  int id;
  double idUsuario;
  String estiloVida;
  String estadoCivil;
  int miembrosHogar;
  int idEstadoEconomico;
  String nivelEducacion;
  double ingresoEconomico;
  Municipio estadoEconomico;
  Municipio tipoAlojamiento;

  PerfilAdopcion({
    required this.id,
    required this.idUsuario,
    required this.estiloVida,
    required this.estadoCivil,
    required this.miembrosHogar,
    required this.idEstadoEconomico,
    required this.nivelEducacion,
    required this.ingresoEconomico,
    required this.estadoEconomico,
    required this.tipoAlojamiento,
  });

  factory PerfilAdopcion.fromRawJson(String str) =>
      PerfilAdopcion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PerfilAdopcion.fromJson(Map<String, dynamic> json) => PerfilAdopcion(
        id: json["id"],
        idUsuario: json["idUsuario"]?.toDouble(),
        estiloVida: json["estiloVida"],
        estadoCivil: json["estadoCivil"],
        miembrosHogar: json["miembrosHogar"],
        idEstadoEconomico: json["idEstadoEconomico"],
        nivelEducacion: json["nivelEducacion"],
        ingresoEconomico: json["ingresoEconomico"]?.toDouble(),
        estadoEconomico: Municipio.fromJson(json["EstadoEconomico"]),
        tipoAlojamiento: Municipio.fromJson(json["TipoAlojamiento"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idUsuario": idUsuario,
        "estiloVida": estiloVida,
        "estadoCivil": estadoCivil,
        "miembrosHogar": miembrosHogar,
        "idEstadoEconomico": idEstadoEconomico,
        "nivelEducacion": nivelEducacion,
        // "ingresoEconomico": ingresoEconomico,
        // "EstadoEconomico": estadoEconomico.toJson(),
        // "TipoAlojamiento": tipoAlojamiento.toJson(),
      };
}

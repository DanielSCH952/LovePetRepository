class Municipio {
  int? idMunicipio;
  int? idEstado;
  String municipio;

  Municipio({
    required this.municipio,
    this.idEstado,
    this.idMunicipio,
  });

  factory Municipio.fromJson(Map<String, dynamic> json) {
    return Municipio(
      idMunicipio: json['idMunicipio'],
      idEstado: json['idEstado'],
      municipio: json['municipio'],
    );
  }
}

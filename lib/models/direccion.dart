class Direccion {
  int? id;
  int? idMunicipio;
  String? municio;
  String? estado;
  String cp;

  Direccion({
    this.id,
    this.idMunicipio,
    this.municio,
    this.estado,
    required this.cp,
  });
  factory Direccion.fromJson(Map<String, dynamic> $json) {
    return Direccion(
      id: int.parse($json['id']),
      municio: $json['municipio']['nombre'],
      estado: $json['estado']['nombre'],
      cp: $json['cp']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "cp": cp,
      "idMunicio": idMunicipio,
    };
  }
}

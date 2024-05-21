class Estado {
  int? idEstado;
  String estado;

  Estado({
    required this.estado,
    this.idEstado,
  });

  factory Estado.fromJson(Map<String, dynamic> json) {
    return Estado(
      idEstado: json['idEstado'],
      estado: json['estado'],
    );
  }
}

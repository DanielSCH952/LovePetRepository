class ResponseAPI {
  int statusCode;
  String message;
  dynamic data;

  ResponseAPI({
    this.data,
    required this.message,
    required this.statusCode,
  });

  factory ResponseAPI.fromJSON(Map<String, dynamic> $json) {
    return ResponseAPI(
      message: $json['message'],
      statusCode: $json['statusCode'],
      data: $json['data'],
    );
  }
}

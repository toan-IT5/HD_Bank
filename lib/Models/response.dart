import 'dart:convert';

class Response {
  String responseId;
  String responseMessage;
  String responseTime;
  String responseCode;
  Response({
    required this.responseId,
    required this.responseMessage,
    required this.responseTime,
    required this.responseCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'responseId': responseId,
      'responseMessage': responseMessage,
      'responseTime': responseTime,
      'responseCode': responseCode,
    };
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      responseId: map['responseId'] ?? "",
      responseMessage: map['responseMessage'] ?? "",
      responseTime: map['responseTime'] ?? "",
      responseCode: map['responseCode'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Response.fromJson(String source) =>
      Response.fromMap(json.decode(source) as Map<String, dynamic>);
}

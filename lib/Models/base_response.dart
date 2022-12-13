// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hd_bank/Models/response.dart';

class BaseResponse {
  Response response;
  String data;
  BaseResponse({
    required this.response,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'response': response.toMap(),
      'data': data,
    };
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      response: Response.fromMap(map['response'] as Map<String, dynamic>),
      data: json.encode(map['data'] ?? ""),
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromJson(String source) =>
      BaseResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

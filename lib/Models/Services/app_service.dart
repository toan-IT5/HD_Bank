import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hd_bank/Models/Apis/api_helper.dart';
import 'package:hd_bank/Models/Apis/app_exception.dart';
import 'package:hd_bank/Models/Services/Common/base_service.dart';
import 'package:hd_bank/Models/base_response.dart';
import 'package:hd_bank/constants.dart';
import 'package:http/http.dart' as http;

class AppService extends BaseService {
  @override
  Future getResponse(String url, {Map<String, dynamic>? params}) async {
    if (kDebugMode) {
      print(url);
    }
    var uri = Uri.parse(baseUrl + url);

    dynamic responseJson;
    try {
      http.Response response;
      if (params != null) {
        response = await http.post(uri,
            body: params.toString(), headers: ApiHelper().getHeaders());
      } else {
        response = await http.get(uri, headers: ApiHelper().getHeaders());
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }
    switch (response.statusCode) {
      case 200:
        BaseResponse result = BaseResponse.fromJson(response.body);
        switch (result.response.responseCode) {
          case "00":
            return jsonDecode(result.data);
          case "01":
            throw SeverException(Message.messageCode01);
          case "02":
            throw SeverException(Message.messageCode02);
          case "03":
            throw SeverException(Message.messageCode03);
          case "04":
            throw SeverException(Message.messageCode04);
          case "05":
            throw SeverException(Message.messageCode05);
          case "06":
            throw SeverException(Message.messageCode06);
          case "07":
            throw SeverException(Message.messageCode07);
          case "08":
            throw SeverException(Message.messageCode08);
          case "09":
            throw SeverException(Message.messageCode09);
          case "10":
            throw SeverException(Message.messageCode10);
          case "11":
            throw SeverException(Message.messageCode11);
          case "99":
            throw SeverException(Message.messageCode99);
        }
        break;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }
}

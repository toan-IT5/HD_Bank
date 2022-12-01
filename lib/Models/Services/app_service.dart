import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hd_bank/Models/Apis/api_helper.dart';
import 'package:hd_bank/Models/Apis/app_exception.dart';
import 'package:hd_bank/Models/Services/Common/base_service.dart';
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
        dynamic responseJson = jsonDecode(response.body);
        if (kDebugMode) {
          print(responseJson);
        }
        return responseJson;
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

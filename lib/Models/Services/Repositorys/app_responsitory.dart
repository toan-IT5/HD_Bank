import 'package:flutter/foundation.dart';
import 'package:hd_bank/Models/Apis/api_helper.dart';
import 'package:hd_bank/Models/Services/Common/base_service.dart';
import 'package:hd_bank/Models/Services/app_service.dart';
import 'package:hd_bank/Models/user.dart';
import 'package:hd_bank/Utils/body_helper.dart';

class AppReponsitory {
  final BaseService _appService = AppService();

  Future<String> getKey() async {
    dynamic response = await _appService.getResponse(Enpoints.getKey);
    final key = response['data']['key'] as String;
    return key;
  }

  Future<bool> login(User user, String key) async {
    await _appService.getResponse(Enpoints.login,
        params: await BodyHelper.getLoginParam(user, key));
    return true;
  }

  Future<String> register(User user, String key) async {
    var response = await _appService.getResponse(Enpoints.register,
        params: await BodyHelper.getRegisterParam(user, key));
    final userId = response['data']['userId'] as String;
    if (kDebugMode) {
      print("Đăng ký thành công $userId");
    }
    return userId;
  }
}

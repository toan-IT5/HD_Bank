import 'package:flutter/foundation.dart';
import 'package:hd_bank/Models/Apis/api_helper.dart';
import 'package:hd_bank/Models/Services/Common/base_service.dart';
import 'package:hd_bank/Models/Services/app_service.dart';
import 'package:hd_bank/Models/transfer.dart';
import 'package:hd_bank/Models/user.dart';
import 'package:hd_bank/Utils/body_helper.dart';

class AppReponsitory {
  final BaseService _appService = AppService();

  Future<String> getKey() async {
    dynamic response = await _appService.getResponse(Enpoints.getKey);
    final key = response['key'] as String;
    return key;
  }

  Future<String?> login(User user, String key) async {
    var response = await _appService.getResponse(Enpoints.login,
        params: await BodyHelper.getLoginParams(user, key));
    return response["accountNo"];
  }

  Future<String> register(User user, String key) async {
    var response = await _appService.getResponse(Enpoints.register,
        params: await BodyHelper.getRegisterParams(user, key));
    final userId = response['userId'] as String;
    if (kDebugMode) {
      print("Đăng ký thành công $userId");
    }
    return userId;
  }

  Future<String> balance(String accountNo) async {
    var response = await _appService.getResponse(Enpoints.balance,
        params: await BodyHelper.getBlanceParams(accountNo));
    final balance = response['amount'] as String;
    if (kDebugMode) {
      print("Số dư là: $balance");
    }
    return balance;
  }

  Future<void> transfer(Transfer transfer) async {
    await _appService.getResponse(Enpoints.transfer,
        params: await BodyHelper.getTransferParams(transfer));
  }
}

import 'package:flutter/material.dart';
import 'package:hd_bank/Models/Apis/api_response.dart';
import 'package:hd_bank/Models/Services/Repositorys/app_responsitory.dart';
import 'package:hd_bank/Models/user.dart';

class AppNotifiler with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Không có dữ liệu');

  String _key = "";
  User? _user;
  bool _authorize = false;
  int _page = 0;

  String get key => _key;
  User? get user => _user;
  ApiResponse get response => _apiResponse;
  bool get authorize => _authorize;
  int get page => _page;

  AppNotifiler() {
    // ignore: avoid_print
    getKey().then((value) => {
          // print("Khỏi tạo API $_key")
        });
    // print("Khỏi tạo API $_key");
  }

  Future<void> getKey() async {
    _apiResponse = ApiResponse.loading('Đang lấy API KEY');
    notifyListeners();
    try {
      _key = await AppReponsitory().getKey();
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> login(User user) async {
    _apiResponse = ApiResponse.loading('Đang lấy API KEY');
    notifyListeners();
    try {
      var isSuccess = await AppReponsitory().login(user, key);
      if (isSuccess) {
        _user = user;
        _authorize = true;
      }
      _apiResponse = ApiResponse.completed("Đăng nhập thành công");
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> register(User user) async {
    _apiResponse = ApiResponse.loading('Đang lấy API KEY');
    notifyListeners();
    try {
      var userId = await AppReponsitory().register(user, key);
      _apiResponse = ApiResponse.completed(userId);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  void setKey(String key) {
    _key = key;
    notifyListeners();
  }

  void setUser(User key) {
    _user = user;
    notifyListeners();
  }

  void setPage(int page) {
    _page = page;
    notifyListeners();
  }
}

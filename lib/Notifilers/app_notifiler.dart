import 'package:flutter/foundation.dart';
import 'package:hd_bank/Models/Apis/api_response.dart';
import 'package:hd_bank/Models/Services/Repositorys/app_responsitory.dart';
import 'package:hd_bank/Models/user.dart';
import 'package:hd_bank/Utils/shared_preferences_helper.dart';

class AppNotifiler with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Không có dữ liệu');

  String _key = "";
  User? _user;
  bool _authorize = false;
  int _page = 4;
  String _accountNo = "";
  bool _isAuthorized = false;

  String get key => _key;
  User? get user => _user;
  ApiResponse get response => _apiResponse;
  bool get authorize => _authorize;
  int get page => _page;
  String get accountNo => _accountNo;
  bool get isAuthorized => _isAuthorized;

  AppNotifiler() {
    checkAuthor();
  }

  Future<void> checkAuthor() async {
    getKey();
    _user = await SharedPrefHelper.getUser();
    if (_user != null) {
      await login(_user!);
    }
  }

  Future<void> getKey() async {
    _apiResponse = ApiResponse.loading('Đang lấy API KEY');
    notifyListeners();
    try {
      _key = await SharedPrefHelper.getKey();
      if (_key.isEmpty) {
        _key = await AppReponsitory().getKey();
        SharedPref.save(SharedPrefPath.key, _key);
      }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    }
    notifyListeners();
  }

  Future<void> login(User user) async {
    _apiResponse = ApiResponse.loading('Đang lấy API KEY');
    notifyListeners();
    try {
      String? accountNo = await AppReponsitory().login(user, key);
      if (accountNo!.isNotEmpty) {
        _isAuthorized = true;
        _user = user;
        _authorize = true;
        _accountNo = accountNo;
        _apiResponse = ApiResponse.completed(_accountNo);
        SharedPrefHelper.saveUser(user);
      }
      _apiResponse = ApiResponse.completed("Đăng nhập không thành công.");
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
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
      if (kDebugMode) {
        print(e.toString());
      }
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hd_bank/Models/Apis/api_response.dart';
import 'package:hd_bank/Models/Services/Repositorys/app_responsitory.dart';
import 'package:hd_bank/Models/feature.dart';
import 'package:hd_bank/Models/user.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Utils/shared_preferences_helper.dart';

class AppNotifiler with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Không có dữ liệu');

  String _key = "";
  User? _user;
  bool _authorize = false;
  int _page = 0;
  String _accountNo = "";
  bool _isAuthorized = false;
  bool _isOpenBalance = false;
  double _balance = 0;

  String get key => _key;
  User? get user => _user;
  ApiResponse get response => _apiResponse;
  bool get authorize => _authorize;
  int get page => _page;
  String get accountNo => _accountNo;
  bool get isAuthorized => _isAuthorized;
  bool get isOpenBalance => _isOpenBalance;
  double get balance => _balance;

  AppNotifiler() {
    checkAuthor().then((value) => print(_accountNo));
  }

  Future<void> checkAuthor() async {
    getKey();
    _user = await SharedPrefHelper.getUser();
    _accountNo = await SharedPrefHelper.getAccountNo();
    if (_user != null && _accountNo.isEmpty) {
      await login(_user!);
    } else if (_user != null && _accountNo.isNotEmpty) {
      _authorize = true;
      //Todo: Remove comline code
      // getBalance();
    }
  }

  List<Feature> getFuture() {
    List<Feature> features = List.empty(growable: true);
    features.add(
      Feature(
        name: "Đóng học phí",
        image: "assets/icons/university.png",
        padding: 10,
        bachgroundColor: BaseColor.secondaryOrange,
      ),
    );
    features.add(
      Feature(
        name: "Tiền nước",
        image: "assets/icons/water_money.png",
        bachgroundColor: BaseColor.transfer,
      ),
    );
    features.add(
      Feature(
        name: "Vé số",
        image: "assets/icons/lottery.png",
        bachgroundColor: BaseColor.orange,
        padding: 10,
      ),
    );
    features.add(
      Feature(
        name: "Tiền điện",
        image: "assets/icons/hydroelectric.png",
        bachgroundColor: Colors.yellow,
        padding: 8,
      ),
    );
    features.add(
      Feature(
        name: "Internet",
        image: "assets/icons/bill.png",
        bachgroundColor: const Color(0xFF87CEFA),
      ),
    );
    features.add(
      Feature(
        name: "Xem tất cả",
        image: "assets/icons/view_more.png",
        padding: 0,
      ),
    );
    return features;
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
        SharedPrefHelper.saveAccountNo(accountNo);
        if (kDebugMode) {
          print("Login Success: $accountNo");
        }
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

  Future<void> getBalance() async {
    _apiResponse = ApiResponse.loading('Đang lấy API KEY');
    notifyListeners();
    try {
      var balance = await AppReponsitory().balance(_accountNo);
      _balance = double.parse(balance);
      _apiResponse = ApiResponse.completed(balance);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      logout();
      if (kDebugMode) {
        print(e.toString());
      }
    }
    notifyListeners();
  }

  Future<void> transfer(String toAcct) async {
    _apiResponse = ApiResponse.loading('Đang chuyển khoản');
    notifyListeners();
    try {
      var balance = await AppReponsitory().balance(_accountNo);
      _balance = double.parse(balance);
      _apiResponse = ApiResponse.completed(balance);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      logout();
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

  void disableContainer() {
    _isOpenBalance = !_isOpenBalance;
    if (_isOpenBalance) {
      getBalance();
    }
    notifyListeners();
  }

  void logout() {
    SharedPrefHelper.removeKeyAndAccountNo();
    _key = "";
    _accountNo = "";
    _authorize = false;
    notifyListeners();
  }
}

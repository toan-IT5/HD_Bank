import 'package:flutter/foundation.dart';
import 'package:hd_bank/Models/Apis/api_response.dart';
import 'package:hd_bank/Models/Services/Repositorys/app_responsitory.dart';
import 'package:hd_bank/Models/fee.dart';
import 'package:hd_bank/Models/transfer.dart';
import 'package:hd_bank/Models/transfer_history.dart';
import 'package:hd_bank/Models/user.dart';
import 'package:hd_bank/Utils/fake_data.dart';
import 'package:hd_bank/Utils/shared_preferences_helper.dart';

class AppNotifiler with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Không có dữ liệu');

  String _key = "";
  User? _user;
  bool _authorize = false;
  int _page = 1;
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
        _isOpenBalance = false;
        SharedPrefHelper.saveAccountNo(accountNo);
        if (kDebugMode) {
          print("Login Success: $accountNo");
        }
        _apiResponse = ApiResponse.completed(_accountNo);
        SharedPrefHelper.saveUser(user);
        notifyListeners();
      }
      _apiResponse = ApiResponse.completed("Đăng nhập không thành công.");
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    }
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

  Future<void> transfer(
      String toAcct, String amount, String description) async {
    _apiResponse = ApiResponse.loading('Đang chuyển khoản');
    notifyListeners();
    try {
      await AppReponsitory().transfer(Transfer(
        amount: amount,
        descrition: description,
        fromAcct: _accountNo,
        toAcct: toAcct,
      ));
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

  Future<void> getFees(String sdId) async {
    _apiResponse = ApiResponse.loading("");
    notifyListeners();
    try {
      List<Fee> list = await AppReponsitory().fee(sdId);
      if (list.isEmpty) list = Data.getFees();
      _apiResponse = ApiResponse.completed(list);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    }
    notifyListeners();
  }

  Future<void> payment(String sdId, String amount) async {
    _apiResponse = ApiResponse.loading("");
    notifyListeners();
    try {
      await AppReponsitory().payment(sdId, amount, _accountNo);
      await getFees(sdId);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    }
    notifyListeners();
  }

  Future<List<TransferHistory>> history(String fromDate, String toDate) async {
    try {
      List<TransferHistory> historys =
          await AppReponsitory().history(fromDate, toDate, _accountNo);
      return historys;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return List<TransferHistory>.empty(growable: true);
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

  void resetResponse() {
    _apiResponse = ApiResponse.initial("Không có dữ liệu");
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
    SharedPrefHelper.removeAccountNo();
    _page = 0;
    _accountNo = "";
    _authorize = false;
    notifyListeners();
  }
}

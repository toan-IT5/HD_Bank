import 'package:flutter/material.dart';
import 'package:hd_bank/Models/account.dart';
import 'package:hd_bank/Models/feature.dart';
import 'package:hd_bank/Models/fee.dart';
import 'package:hd_bank/Utils/base_style.dart';

class Data {
  static List<Feature> getFuture() {
    List<Feature> features = List.empty(growable: true);
    features.add(
      Feature(
          name: "Đóng học phí",
          image: "assets/icons/university.png",
          padding: 10,
          bachgroundColor: BaseColor.secondaryOrange,
          type: EActionType.Tuition),
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

  static List<Account> getAccount() {
    List<Account> accounts = List.empty(growable: true);
    accounts.add(
      Account(
          name: "HO VAN TOAN",
          accountNo: "002704070000088",
          image: "assets/images/logo.png"),
    );
    accounts.add(
      Account(
          name: "HO VAN TOAN",
          accountNo: "045704070000018",
          image: "assets/images/HD_bank_icon.png"),
    );
    accounts.add(
      Account(
          name: "HO VAN TOAN",
          accountNo: "002704070000088",
          image: "assets/images/logo.png"),
    );
    accounts.add(
      Account(
          name: "HO VAN TOAN",
          accountNo: "002704070000088",
          image: "assets/images/logo.png"),
    );
    return accounts;
  }

  static List<Fee> getFees() {
    List<Fee> fees = List.empty(growable: true);
    fees.add(Fee(fee: "50000", description: "Học phí Hutech"));
    return fees;
  }
}

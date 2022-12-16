import 'package:flutter/material.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Utils/money_helper.dart';

class BalanceView extends StatelessWidget {
  const BalanceView({
    Key? key,
    required this.isOpentBalance,
    required this.size,
    required this.spaceSize,
    required this.balance,
  }) : super(key: key);

  final bool isOpentBalance;
  final Size size;
  final double spaceSize;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        height: isOpentBalance ? 150 : 0,
        curve: Curves.fastOutSlowIn,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Image.asset("assets/images/HD_bank_icon.png"),
                        ),
                        SizedBox(width: spaceSize),
                        Text(
                          "Số dư",
                          style: BaseTextStyle.body2(color: BaseColor.black),
                        ),
                      ],
                    ),
                    SizedBox(width: spaceSize),
                    Text(
                      MoneyFormat.moneyFormat(balance.toInt().toString()),
                      style: BaseTextStyle.body2(color: BaseColor.black),
                    ),
                  ],
                ),
                SizedBox(height: spaceSize),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child:
                              Image.asset("assets/images/prestige_points.png"),
                        ),
                        SizedBox(width: spaceSize),
                        Text(
                          "Điểm uy tín",
                          style: BaseTextStyle.body2(color: BaseColor.black),
                        ),
                      ],
                    ),
                    SizedBox(width: spaceSize),
                    Text(
                      "1,000 Điểm",
                      style: BaseTextStyle.body2(color: BaseColor.black),
                    ),
                  ],
                ),
                const Divider(color: BaseColor.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child:
                          Image.asset("assets/icons/pie_chart.png", height: 20),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Quản lý tài sản",
                      style: BaseTextStyle.body2(color: BaseColor.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

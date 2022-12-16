import 'package:flutter/material.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController accountNo = TextEditingController();
    TextEditingController monney = TextEditingController();
    return CommonPage(
        canBack: true,
        menuCallback: () {},
        enableAppBar: true,
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CHUYỂN ĐẾN",
                  style: BaseTextStyle.subtitle3(color: BaseColor.red),
                ),
                const SizedBox(height: 16),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: BaseColor.off,
                          blurRadius: 8,
                          offset: Offset(-2, 2), // Shadow position
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(hintText: "Số tài khoản"),
                          controller: accountNo,
                        ),
                        TextField(
                          decoration:
                              const InputDecoration(hintText: "Số tiền (đ)"),
                          controller: accountNo,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              hintText:
                                  "Nội dung (Không dấu và không bắt buộc)"),
                          controller: accountNo,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

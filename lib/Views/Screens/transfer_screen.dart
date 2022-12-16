import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hd_bank/Models/account.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Utils/fake_data.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';
import 'package:hd_bank/Views/Widgets/custom_button.dart';
import 'package:hd_bank/Views/Widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  var accounts = Data.getAccount();
  TextEditingController accountNo = TextEditingController();
  TextEditingController monney = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CommonPage(
        color: Colors.grey.shade200,
        canBack: true,
        menuCallback: () {
          Navigator.pop(context);
        },
        enableAppBar: true,
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CHUYỂN ĐẾN",
                  style: BaseTextStyle.subtitle3(color: BaseColor.black),
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
                        CustomTextField(
                          textEditController: accountNo,
                          inputType: EInputType.Transfer,
                          enableBorder: false,
                          hintTextString: "Số tài khoản",
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          textEditController: monney,
                          inputType: EInputType.Transfer,
                          enableBorder: false,
                          hintTextString: "Số tiền (đ)",
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: description,
                          decoration: const InputDecoration(
                              hintText:
                                  "Nội dung (Không dấu và không bắt buộc)"),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DANH SÁCH NGƯỜI NHẬN",
                      style: BaseTextStyle.subtitle3(color: BaseColor.black),
                    ),
                    Text(
                      "Tất cả(${accounts.length})",
                      style: BaseTextStyle.caption(color: BaseColor.red),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  height: size.height / 2 - 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: accounts.length,
                    itemBuilder: (context, index) =>
                        buildFeature(accounts[index]),
                  ),
                ),
                CustomButton.common(
                    onTap: () async {
                      await Provider.of<AppNotifiler>(context, listen: false)
                          .transfer(
                              accountNo.text, monney.text, description.text);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Chuyển khoản thành công',
                        desc:
                            'Bạn đã chuyển khoản ${monney.text} cho ${accountNo.text} thành công.',
                        btnOkOnPress: () {
                          Navigator.pop(context);
                        },
                      ).show();
                    },
                    content: "Đồng ý")
              ],
            ),
          ),
        ));
  }

  Widget buildFeature(Account account) {
    return GestureDetector(
      onTap: () {
        accountNo.text = account.accountNo;
        accountNo.text = account.accountNo;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(account.image),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              account.name,
              style: BaseTextStyle.caption(color: BaseColor.black),
            )
          ],
        ),
      ),
    );
  }
}

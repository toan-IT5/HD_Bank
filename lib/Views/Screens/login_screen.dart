import 'package:flutter/material.dart';
import 'package:hd_bank/Models/user.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Views/Screens/user_action.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';
import 'package:hd_bank/Views/Widgets/custom_button.dart';
import 'package:hd_bank/Views/Widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController(text: "vantoan");
  TextEditingController password = TextEditingController(text: "Toan_01473");
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      enableAppBar: true,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/baner.jpg"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintTextString: "Tài khoản",
                    textEditController: username,
                    inputType: EInputType.Default,
                    enableBorder: true,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintTextString: "Mật khẩu",
                    textEditController: password,
                    inputType: EInputType.Password,
                    enableBorder: true,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    child: CustomButton.common(
                      onTap: () {
                        Provider.of<AppNotifiler>(context, listen: false)
                            .login(User(username.text, password.text));
                      },
                      content: "Đăng nhập",
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserActionScreen()),
                      );
                    },
                    child: Text(
                      "Đổi mật khẩu? | Đăng ký",
                      style: BaseTextStyle.body2(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

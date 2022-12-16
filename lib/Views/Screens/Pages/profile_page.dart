import 'package:flutter/material.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';
import 'package:hd_bank/Views/Widgets/custom_button.dart';
import 'package:hd_bank/Views/Widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AppNotifiler>(context, listen: false).user;
    return CommonPage(
      enableAppBar: true,
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                  lable: "Tên đăng nhập",
                  textEditController:
                      TextEditingController(text: user!.username),
                  inputType: EInputType.Default,
                  enableBorder: true),
              const SizedBox(height: 16),
              CustomTextField(
                  prefixIcon: Icon(
                    Icons.boy,
                    color: Theme.of(context).primaryColor,
                  ),
                  lable: "Tên đầy đủ",
                  textEditController:
                      TextEditingController(text: "Hồ Văn Toàn"),
                  inputType: EInputType.Default,
                  enableBorder: true),
              const SizedBox(height: 16),
              CustomTextField(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColor,
                  ),
                  lable: "Email",
                  textEditController:
                      TextEditingController(text: "toan01473@gmail.com"),
                  inputType: EInputType.Default,
                  enableBorder: true),
              const SizedBox(height: 16),
              CustomTextField(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Theme.of(context).primaryColor,
                  ),
                  lable: "Số điện thoại",
                  textEditController: TextEditingController(text: "0336516906"),
                  inputType: EInputType.Default,
                  enableBorder: true),
              const SizedBox(height: 16),
              CustomButton.common(
                  onTap: () {
                    Provider.of<AppNotifiler>(context, listen: false).logout();
                  },
                  content: "Đăng xuất")
            ],
          ),
        ),
      ),
    );
  }
}

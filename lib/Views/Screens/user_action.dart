import 'package:flutter/material.dart';
import 'package:hd_bank/Models/user.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Views/Screens/login_screen.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';
import 'package:hd_bank/Views/Widgets/custom_button.dart';
import 'package:hd_bank/Views/Widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class UserActionScreen extends StatefulWidget {
  const UserActionScreen({Key? key}) : super(key: key);

  @override
  State<UserActionScreen> createState() => _UserActionScreenState();
}

class _UserActionScreenState extends State<UserActionScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController username = TextEditingController(text: "vantoan2");
  TextEditingController password = TextEditingController(text: "Toan_01473");
  TextEditingController rePassword = TextEditingController(text: "Toan_01473");
  TextEditingController email =
      TextEditingController(text: "toan01473@gmail.com");
  TextEditingController fullName = TextEditingController(text: "Ho Van Toan");
  TextEditingController phone = TextEditingController(text: "0336516906");

  int _currentIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CommonPage(
        enableAppBar: true,
        canBack: true,
        backAction: () => Navigator.pop(context),
        content: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              SizedBox(
                width: 270,
                child: buildTabBarContainer(
                  context: context,
                  content: TabBar(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        buildTab(
                            title: "Đăng ký",
                            index: _currentIndex,
                            position: 0),
                        buildTab(
                            title: "Đổi mật khẩu",
                            index: _currentIndex,
                            position: 1),
                      ]),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: size.height * 0.8,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [getRegisterPage(), getRegisterPage()],
                ),
              ),
            ],
          ),
        ));
  }

  Tab buildTab(
      {required String title, required int index, required int position}) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: (index == position) ? BaseColor.blue : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Center(
          child: Text(title,
              style: BaseTextStyle.subtitle1(
                  color: (index == position) ? Colors.white : BaseColor.hint)),
        ),
      ),
    );
  }

  Widget buildTabBarContainer(
      {required TabBar content, required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: BaseColor.blue.withOpacity(0.15),
            ),
            const BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 10.0,
                offset: Offset(0, 1))
          ]),
      height: 56,
      child: content,
    );
  }

  Widget getRegisterPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
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
          CustomTextField(
            hintTextString: "Nhập lại mật",
            textEditController: rePassword,
            inputType: EInputType.Password,
            enableBorder: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintTextString: "Email",
            textEditController: email,
            inputType: EInputType.Email,
            enableBorder: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintTextString: "Tên đầy đủ",
            textEditController: fullName,
            inputType: EInputType.Default,
            enableBorder: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintTextString: "Số điện thoại",
            maxLength: 10,
            textEditController: phone,
            inputType: EInputType.Number,
            enableBorder: true,
          ),
          const SizedBox(height: 16),
          CustomButton.common(
              onTap: () {
                Provider.of<AppNotifiler>(context, listen: false).register(User(
                    username.text, password.text,
                    email: email.text,
                    fullname: fullName.text,
                    phone: phone.text));
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              content: "Đồng ý"),
        ],
      ),
    );
  }
}

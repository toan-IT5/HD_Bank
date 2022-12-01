import 'package:flutter/material.dart';
import 'package:hd_bank/Models/user.dart';
import 'package:hd_bank/Views/Widgets/custom_appbar.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({
    Key? key,
    required this.content,
    this.user,
    this.enableAppBar = false,
    this.canBack,
    this.backAction,
    this.actionPath,
    this.action,
    this.menuCallback,
  }) : super(key: key);

  final Widget content;
  final User? user;
  final bool enableAppBar;
  final bool? canBack;
  final VoidCallback? backAction;
  final String? actionPath;
  final VoidCallback? action;
  final VoidCallback? menuCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Scaffold(
            appBar: customAppBar(context),
            backgroundColor: Colors.white,
            body: SafeArea(child: content)));
  }

  PreferredSizeWidget? customAppBar(BuildContext context) {
    if (user != null) {
      return ProfileAppbar(
        name: user!.username,
        avatar: Image.asset("assets/icons/user_icon.jpg"),
      );
    }
    if (enableAppBar) {
      return CommonAppbar(
        canBack: canBack,
        backAction: backAction,
        menuCallback: menuCallback,
      );
    }
    return null;
  }
}

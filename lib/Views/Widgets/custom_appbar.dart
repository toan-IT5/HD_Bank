import 'package:flutter/material.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

const double profileAppbarHeight = 100;
const double commonAppbarHeight = 56;

class CommonAppbar extends StatelessWidget implements PreferredSize {
  const CommonAppbar({
    Key? key,
    this.canBack,
    this.backAction,
    this.actionPath,
    this.action,
    this.menuCallback,
  }) : super(key: key);

  final bool? canBack;
  final VoidCallback? backAction;
  final String? actionPath;
  final VoidCallback? action;
  final VoidCallback? menuCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [BaseBoxShadow.componentBoxShadow]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                canBack == true ? actionComponent(context) : Container(),
                SizedBox(width: canBack == true ? 16 : 0),
                Image.asset("assets/images/logo.png", fit: BoxFit.fill),
              ],
            ),
            Row(
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    width: 25,
                    height: 25,
                    child: Image.asset("assets/icons/qr_code.png",
                        fit: BoxFit.scaleDown),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget actionComponent(BuildContext context) {
    if (menuCallback != null) {
      return GestureDetector(
        child: Container(
          width: 32,
          height: 32,
          color: Colors.transparent,
          alignment: Alignment.centerRight,
          child: Image.asset(
            "assets/icons/back.png",
            height: 20,
            fit: BoxFit.fitHeight,
          ),
        ),
        onTap: () => menuCallback!(),
      );
    }
    return const SizedBox(height: 32, width: 32);
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(commonAppbarHeight);
}

class ProfileAppbar extends StatelessWidget implements PreferredSize {
  const ProfileAppbar({
    Key? key,
    required this.name,
    required this.avatar,
  }) : super(key: key);
  final String name;
  final Image? avatar;

  @override
  Widget build(BuildContext context) {
    bool openBanlance =
        Provider.of<AppNotifiler>(context, listen: true).isOpenBalance;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: BaseColor.red,
            boxShadow: [BaseBoxShadow.componentBoxShadow]),
        child: SafeArea(
          child: Row(children: [
            getAvatar(avatar),
            const SizedBox(width: 12),
            Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    name.toUpperCase(),
                    style: BaseTextStyle.subtitle1(color: BaseColor.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: call open the balance in my wallet.
                      Provider.of<AppNotifiler>(context, listen: false)
                          .disableContainer();
                    },
                    child: Row(
                      children: [
                        Text(
                          openBanlance ? "Ẩn số dư" : "Xem số dư ",
                          style:
                              BaseTextStyle.subtitle1(color: BaseColor.black),
                        ),
                        Transform.rotate(
                          angle: openBanlance ? -math.pi : 0,
                          child: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 36,
                          ),
                        )
                      ],
                    ),
                  )
                ]))
          ]),
        ));
  }

  Widget getAvatar(Image? img) {
    try {
      if (img != null) {
        return CircleAvatar(
          radius: 20,
          foregroundImage: img.image,
          backgroundColor: Colors.white,
        );
      }
      return CircleAvatar(
          radius: 20,
          child: Image.asset('assets/icons/icon.png', fit: BoxFit.cover));
    } catch (e) {
      debugPrint(e.toString());
      return CircleAvatar(
          radius: 20,
          child: Image.asset('assets/icons/icon.png', fit: BoxFit.cover));
    }
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(profileAppbarHeight);
}

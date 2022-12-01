import 'package:flutter/material.dart';
import 'package:hd_bank/Utils/base_style.dart';

const double profileAppbarHeight = 72;
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
                const Icon(Icons.reorder),
                const SizedBox(width: 20),
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
            "assets/icons/action/icon_menu_blue.png",
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
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: [BaseBoxShadow.componentBoxShadow]),
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
                  Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 4),
                      child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              style:
                                  BaseTextStyle.subtitle1(color: Colors.black),
                              children: [
                                const TextSpan(text: "Xin chào người dùng "),
                                TextSpan(
                                    text: name,
                                    style:
                                        const TextStyle(color: BaseColor.blue))
                              ]))),
                  Text(
                    "Chào mừng bạn đã quay trở lại với HD Bank",
                    overflow: TextOverflow.ellipsis,
                    style: BaseTextStyle.body2(color: BaseColor.black),
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

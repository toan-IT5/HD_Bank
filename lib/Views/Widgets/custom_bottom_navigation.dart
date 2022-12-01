import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hd_bank/Utils/base_style.dart';

const BoxShadow bottomBoxShadow =
    BoxShadow(color: Color(0xFFECECEC), blurRadius: 8, offset: Offset(0, 1));

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation(
      {Key? key, required this.index, required this.onIndexChange})
      : super(key: key);
  final int index;
  final Function(int) onIndexChange;

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double customBottomPadding = max(8 - bottomPadding, 0);
    double customHeight = 64.0 + customBottomPadding + bottomPadding;
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white, boxShadow: [bottomBoxShadow]),
        height: customHeight,
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                8, 8, 8, bottomPadding + customBottomPadding),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavigationItem(
                    onIndexChange: onIndexChange,
                    currentIndex: index,
                    itemIndex: 0,
                    selectIconPath:
                        "assets/icons/bottom_navigator/Home_fill.png",
                    unSelectIconPath: "assets/icons/bottom_navigator/Home.png",
                    title: "Trang chủ",
                  ),
                  BottomNavigationItem(
                    onIndexChange: onIndexChange,
                    currentIndex: index,
                    itemIndex: 1,
                    selectIconPath:
                        "assets/icons/bottom_navigator/History_fill.png",
                    unSelectIconPath:
                        "assets/icons/bottom_navigator/History.png",
                    title: "Lịch sử",
                  ),
                  BottomNavigationItem(
                    onIndexChange: onIndexChange,
                    currentIndex: index,
                    itemIndex: 2,
                    title: "",
                    selectIconPath:
                        "assets/icons/bottom_navigator/QR_scanner.png",
                    unSelectIconPath:
                        "assets/icons/bottom_navigator/QR_scanner.png",
                  ),
                  BottomNavigationItem(
                      onIndexChange: onIndexChange,
                      currentIndex: index,
                      itemIndex: 3,
                      selectIconPath:
                          "assets/icons/bottom_navigator/Notification_fill.png",
                      unSelectIconPath:
                          "assets/icons/bottom_navigator/Notification.png",
                      title: "Thông báo"),
                  BottomNavigationItem(
                    onIndexChange: onIndexChange,
                    currentIndex: index,
                    itemIndex: 4,
                    selectIconPath:
                        "assets/icons/bottom_navigator/Settings_fill.png",
                    unSelectIconPath:
                        "assets/icons/bottom_navigator/Setting.png",
                    title: "Cài đặt",
                  )
                ])));
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem(
      {Key? key,
      required this.onIndexChange,
      required this.currentIndex,
      required this.itemIndex,
      required this.selectIconPath,
      required this.unSelectIconPath,
      required this.title})
      : super(key: key);

  final Function(int) onIndexChange;
  final int currentIndex;
  final int itemIndex;
  final String selectIconPath;
  final String unSelectIconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - 48) / 5;
    return GestureDetector(
        onTap: () => onIndexChange(itemIndex),
        child: Container(
            height: 54,
            width: itemWidth,
            color: Colors.transparent,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (itemIndex == 2)
                    Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                            color: BaseColor.orange,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(250, 175, 64, 0.5),
                                  spreadRadius: 0,
                                  blurRadius: 12,
                                  offset: Offset(0, 4))
                            ]),
                        child: Center(
                            child: Image.asset(selectIconPath,
                                height: 32, width: 32, fit: BoxFit.fitHeight))),
                  if (itemIndex != 2)
                    Image.asset(
                        (currentIndex == itemIndex)
                            ? selectIconPath
                            : unSelectIconPath,
                        height: 24,
                        width: 24,
                        fit: BoxFit.fitHeight),
                  if (itemIndex != 2)
                    Text(title,
                        overflow: TextOverflow.ellipsis,
                        style: BaseTextStyle.navigation(
                            color: (itemIndex == currentIndex)
                                ? BaseColor.blue
                                : BaseColor.off))
                ])));
  }
}

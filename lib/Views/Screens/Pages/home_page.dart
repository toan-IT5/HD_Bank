import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Views/Widgets/account_action.dart';
import 'package:hd_bank/Views/Widgets/balance_view.dart';
import 'package:hd_bank/Views/Widgets/carousel_slider.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../Widgets/build_feature.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    /// Ask camera permission after login if not authorized
    /// Android auto ask when move to QR Screen -> don't need to ask at homepage
    // askPermissions();
  }

  void askPermissions() async {
    if (Platform.isIOS) {
      final cameraStatus = await Permission.camera.status;
      if (cameraStatus.isDenied || cameraStatus.isPermanentlyDenied) {
        Permission.camera.request();
      }
    }
    if (Platform.isAndroid) {
      final locationStatus = await Permission.location.status;
      if (!locationStatus.isGranted) {
        Permission.locationWhenInUse.request();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CommonPage(
        user: Provider.of<AppNotifiler>(context, listen: false).user,
        canBack: false,
        content: buildContent(context));
  }

  Widget buildContent(BuildContext context) {
    bool isOpentBalance =
        Provider.of<AppNotifiler>(context, listen: true).isOpenBalance;
    double balance = Provider.of<AppNotifiler>(context, listen: true).balance;
    Size size = MediaQuery.of(context).size;
    double spaceSize = 16;
    return CommonPage(
      color: BaseColor.red,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BalanceView(
              isOpentBalance: isOpentBalance,
              size: size,
              spaceSize: spaceSize,
              balance: balance,
            ),
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  const SarouselSlider(),
                  const SizedBox(height: 16),
                  AccountAction(size: size),
                  const BuildFeatures()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

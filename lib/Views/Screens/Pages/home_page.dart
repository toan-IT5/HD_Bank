import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Views/Widgets/common_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

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
    askPermissions();
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
    return CommonPage(
        content: Center(
      child: RichText(
        text: const TextSpan(
          text: 'Xin chào ',
          style: TextStyle(color: Colors.red, fontSize: 24),
          children: <TextSpan>[
            TextSpan(
                text: 'HUTECH', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Views/Screens/Pages/barcode_page.dart';
import 'package:hd_bank/Views/Screens/Pages/history_page.dart';
import 'package:hd_bank/Views/Screens/Pages/home_page.dart';
import 'package:hd_bank/Views/Screens/Pages/notify_page.dart';
import 'package:hd_bank/Views/Screens/Pages/profile_page.dart';
import 'package:hd_bank/Views/Widgets/custom_bottom_navigation.dart';
import 'package:provider/provider.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({Key? key}) : super(key: key);

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const HistoryPage(),
      const BarcodePage(),
      const NotifyPage(),
      const ProfilePage()
    ];
    int page = Provider.of<AppNotifiler>(context, listen: true).page;
    PageController controller = PageController(initialPage: page);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigation(
          index: page,
          onIndexChange: (index) {
            Provider.of<AppNotifiler>(context, listen: false).setPage(index);
            controller.jumpToPage(index);
          }),
      body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: pages),
    );
  }
}

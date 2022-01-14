import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/Screens/profile.dart';
import 'package:pospayment/Screens/qr_scan.dart';
import 'package:pospayment/bottomMenu/homeBottomMenu.dart';
import 'package:pospayment/loginlogout/login.dart';
import 'package:get/get.dart';

class MaterilRoutes extends StatefulWidget {
  const MaterilRoutes({Key key}) : super(key: key);

  @override
  _MaterilRoutesState createState() => _MaterilRoutesState();
}

class _MaterilRoutesState extends State<MaterilRoutes> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => HomeMenu()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/profile', page: () => Profile()),
        GetPage(name: '/qrScan', page: () => QrScanner())
      ],
      initialRoute: GetStorage().hasData('token') ? '/home' : '/login',
    );
  }
}

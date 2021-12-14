import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:pospayment/buttommenu/homebuttommenu.dart';
import 'package:pospayment/loginlogout/login.dart';

class MaterilRoutes extends StatefulWidget {
  const MaterilRoutes({Key key}) : super(key: key);

  @override
  _MaterilRoutesState createState() => _MaterilRoutesState();
}

class _MaterilRoutesState extends State<MaterilRoutes> {
  final box = GetStorage();
  bool hasToken = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: box.hasData('token') ? "/" : "login",
      routes: {
        '/': (context) => const Login(
              title: "login",
            ),
        '/HomeScreen': (context) => const HomeMenu(),
      },
    );
  }
}

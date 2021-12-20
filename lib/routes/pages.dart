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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  GetStorage().hasData('token') ? HomeMenu():Login(),
    );
  }
}

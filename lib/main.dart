import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/routes/pages.dart';

void main() async{
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterilRoutes();
  }
}

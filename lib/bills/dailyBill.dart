import 'package:flutter/material.dart';
import 'package:get/get.dart  ';
class DailyBill extends StatefulWidget {
  const DailyBill({ Key key }) : super(key: key);

  @override
  _DailyBillState createState() => _DailyBillState();
}

class _DailyBillState extends State<DailyBill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ການພີມບິນ'),
        backgroundColor: Colors.teal,
        actions: [
          InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.blue,
            child: const Icon(Icons.print, color: Colors.white, size: 50),
            onTap: () {
              
            },
          ),
        ],
        ),
        body: Center(
          child: Text('code : ${Get.arguments}'),
        ),
    );
  }
}
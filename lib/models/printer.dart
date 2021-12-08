//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';

class PrintBill extends StatefulWidget {
  const PrintBill({Key? key}) : super(key: key);

  @override
  _PrintBillState createState() => _PrintBillState();
}

class _PrintBillState extends State<PrintBill> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Test Sunni Printer'),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            Center(
              child: RaisedButton(
                onPressed: (){},
                child: const Text('Print demo', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';
import 'package:pospayment/controllers/billTest.dart';
import 'package:pospayment/controllers/callgetme.dart';
import 'package:pospayment/controllers/monthlyPayment.dart';
import 'package:get/get.dart';
import 'package:pospayment/format/number.dart';
import 'package:pospayment/models/monthlyPaymentModel.dart';


class PaymentOfMonth extends StatefulWidget {
  const PaymentOfMonth({Key key}) : super(key: key);

  @override
  _PaymentOfMonthState createState() => _PaymentOfMonthState();
}

class _PaymentOfMonthState extends State<PaymentOfMonth> {
  String zone = 'Zone A';
  CounterController controller = Get.put(CounterController());

  billTestController bills = Get.put(billTestController());

  List<MonthlyPaymentModel> customers = [];
  RoomNameController room = Get.put(RoomNameController());
  @override
  void initState() {
    super.initState();
    customers = room.roomName.where((i) => i.zone == zone).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                      ),
                      child: const Center(
                        child: Text('ເງິນລວມ : 350,000,000  ກີບ',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(
                    top: 1.0, start: 1.0, end: 1.0),
                height: 1.0,
                color: Colors.green,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.green, spreadRadius: 2),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  value: zone,
                  icon: const Icon(
                    Icons.format_list_bulleted,
                    color: Colors.green,
                  ),
                  iconSize: 20,
                  elevation: 16,
                  style: const TextStyle(color: Colors.green),
                  underline: Container(
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newZone) {
                    var rs =
                        room.roomName.where((i) => i.zone == newZone).toList();
                    setState(() {
                      zone = newZone;
                      customers = rs;
                    });
                  },
                  items: <String>['Zone A', 'Zone B', 'Zone C', 'Zone D']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                )),
              ),
              SizedBox(
                height: 403,
                width: 300,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: ListView.builder(
                      itemCount: customers.length,
                      itemBuilder: (context, index) {
                        return _builItem(index);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.tealAccent.shade700,
    );
  }

  Widget _builItem(int index) {
     return InkWell(
      splashColor: Colors.yellow,
       borderRadius: BorderRadius.circular(12),
      //highlightColor: Colors.orangeAccent,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(customers[index].name,
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Icon(
                  Icons.print,
                  size: 30,
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
      return _print(index);
      },
    );
  }

  _print(int index)  async {
    // Test regular text
    SunmiPrinter.text(
      'ໃບບິນ',
      styles: SunmiStyles(align: SunmiAlign.center),
    );
    SunmiPrinter.emptyLines(1);
    SunmiPrinter.text(
      controller.users.value.marketId.name,
      styles:
      SunmiStyles(bold: true, underline: true, align: SunmiAlign.left),
    );

    SunmiPrinter.text(
      'ວັນທີ : 16/01/2022',
      styles:
      SunmiStyles(  align: SunmiAlign.left),
    );
    SunmiPrinter.text(
      'ເລກທີ : 123',
      styles: SunmiStyles(  align: SunmiAlign.left),
    );
    SunmiPrinter.text(
      'ຮ້ານ :' + customers[index].name,
      styles: SunmiStyles(  align: SunmiAlign.left),
    );
    SunmiPrinter.hr();
    SunmiPrinter.emptyLines(1);
    SunmiPrinter.row(
      cols: [
        SunmiCol(text: 'ລາຍການ', width: 6, align: SunmiAlign.left),
        SunmiCol(text: 'ຈຳນວນເງິນ', width: 6, align: SunmiAlign.right),
      ],
    );
    // Test row

    for (int i = 0; i < bills.datas.datas.length; i++)

      SunmiPrinter.row(
        cols: [
          SunmiCol(text: bills.datas.datas[i].list, width: 6,align: SunmiAlign.left),
          SunmiCol(text: f.format(bills.datas.datas[i].price), width: 6, align: SunmiAlign.right),
        ],
      );
    SunmiPrinter.hr();
    SunmiPrinter.text(
      f.format(int.parse(bills.datas.totalPrice)),
      styles: SunmiStyles(  align: SunmiAlign.right),
    );
    SunmiPrinter.emptyLines(1);
    SunmiPrinter.hr();
    SunmiPrinter.text(
      'ຜຸ້ເກັບເງິນ : ' +  controller.users.value.firstName,
      styles: SunmiStyles( underline: true, align: SunmiAlign.right),
    );
    SunmiPrinter.emptyLines(3);
  }
}


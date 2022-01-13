import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pospayment/controllers/monthlyPayment.dart';
import 'package:get/get.dart';
import 'package:pospayment/models/monthlyPaymentModel.dart';
import 'package:pospayment/format/number.dart';

class PaymentOfMonth extends StatefulWidget {
  const PaymentOfMonth({Key key}) : super(key: key);

  @override
  _PaymentOfMonthState createState() => _PaymentOfMonthState();
}

class _PaymentOfMonthState extends State<PaymentOfMonth> {
  String zone = 'Zone A';

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
        return showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            //title:  Text(paidStores.paidStoreData[index].name),
            content: Container(
              height: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ຮ້ານ : '),
                      Text(customers[index].name)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ຈຳນວນເງິນ : '),
                      Text(f.format(customers[index].status))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ໂຊນ : '),
                      Text(customers[index].zone)
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

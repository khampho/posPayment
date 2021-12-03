import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pospayment/Screens/profile.dart';

class PaymentOfMonth extends StatefulWidget {
  const PaymentOfMonth({Key? key}) : super(key: key);

  @override
  _PaymentOfMonthState createState() => _PaymentOfMonthState();
}

class _PaymentOfMonthState extends State<PaymentOfMonth> {
  String zone = 'Zone A';

  ///
  final List<Customer> custS = [
    Customer(id: 1, name: "ຮ້ານ ນາງວຽງແກ້ວ", zone: 'Zone A'),
    Customer(id: 2, name: "ຮ້ານ ນາງພູວັນ", zone: 'Zone A'),
    Customer(id: 3, name: "ຮ້ານ ນາງສົມຈິດ", zone: 'Zone A'),
    Customer(id: 4, name: "ຮ້ານ ນາງແສງຈັນ", zone: 'Zone A'),
    Customer(id: 1, name: "ຮ້ານ ນາງວຽງແກ້ວ", zone: 'Zone A'),
    Customer(id: 2, name: "ຮ້ານ ນາງພູວັນ", zone: 'Zone A'),
    Customer(id: 3, name: "ຮ້ານ ນາງສົມຈິດ", zone: 'Zone A'),
    Customer(id: 4, name: "ຮ້ານ ນາງແສງຈັນ", zone: 'Zone A'),
    Customer(id: 1, name: "ຮ້ານ ນາງວຽງແກ້ວ", zone: 'Zone A'),
    Customer(id: 2, name: "ຮ້ານ ນາງພູວັນ", zone: 'Zone A'),
    Customer(id: 3, name: "ຮ້ານ ນາງສົມຈິດ", zone: 'Zone A'),
    Customer(id: 4, name: "ຮ້ານ ນາງແສງຈັນ", zone: 'Zone A'),
    Customer(id: 1, name: "ຮ້ານ ນາງວຽງແກ້ວ", zone: 'Zone A'),
    Customer(id: 2, name: "ຮ້ານ ນາງພູວັນ", zone: 'Zone A'),
    Customer(id: 3, name: "ຮ້ານ ນາງສົມຈິດ", zone: 'Zone A'),
    Customer(id: 4, name: "ຮ້ານ ນາງແສງຈັນ", zone: 'Zone A'),
    Customer(id: 5, name: "ຮ້ານ ນາງວຽງແກ້ວ", zone: 'Zone B'),
    Customer(id: 6, name: "ຮ້ານ ນາງພູວັນ", zone: 'Zone B'),
    Customer(id: 7, name: "ຮ້ານ ນາງວຽງແກ້ວ", zone: 'Zone B'),
    Customer(id: 8, name: "ຮ້ານ ນາງພູວັນ", zone: 'Zone B'),
    Customer(id: 9, name: "ຮ້ານ ນາງສົມຈິດ", zone: 'Zone C'),
    Customer(id: 10, name: "ຮ້ານ ນາງແສງຈັນ", zone: 'Zone C'),
    Customer(id: 11, name: "ຮ້ານ ນາງພູວັນ", zone: 'Zone D'),
    Customer(id: 13, name: "ຮ້ານ ນາງສົມຈິດ", zone: 'Zone D'),
  ];

  List<Customer> filtercustS = [];
  @override
  void initState() {
    super.initState();
    filtercustS = custS.where((i) => i.zone == zone).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(box.read('M_name')),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.blue,
            child: const Icon(Icons.person, color: Colors.white, size: 50),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Profile();
                }));
              });
            },
          ),
        ],
      ),
      body: Card(
        color: Colors.white60,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 220,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 3),
                      ],
                    ),
                    child: const Center(
                      child: Text('ເງິນລວມ : 350,000  ກີບ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 0, bottom: 20),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.print,
                          color: Colors.black,
                          size: 60,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: 300,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.lightGreen, spreadRadius: 3),
                ],
              ),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                value: zone,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.green,
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.green),
                underline: Container(
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newZone) {
                  var rs = custS.where((i) => i.zone == newZone).toList();
                  setState(() {
                    zone = newZone!;
                    filtercustS = rs;
                  });
                },
                items: <String>['Zone A', 'Zone B', 'Zone C', 'Zone D']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
              )),
            )),
            const SizedBox(
              height: 3,
            ),
            SizedBox(
              height: 473,
              width: 300,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: ListView.builder(
                    itemCount: filtercustS.length,
                    itemBuilder: (context, index) {
                      return _builItem(index);
                    }),
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.green,
    );
  }

  Widget _builItem(int index) {
    return Card(
      child: Row(
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(50, 30),
              alignment: Alignment.centerLeft,
            ),
            onPressed: () {
              //print(_customer[index].name);
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const BillMarket();
              // }));
            },
            //icon: const Icon(Icons.view_comfy_outlined,color: Colors.green,),

            label: Text(filtercustS[index].name,
                style: const TextStyle(fontSize: 18, color: Colors.green)),
            icon: const Icon(
              Icons.arrow_right,
              size: 40,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class Customer {
  var id;
  var name;
  var zone;
  Customer({this.id, this.name, this.zone});
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pospayment/bottomMenu/payment_of_month.dart';
import 'package:pospayment/bottomMenu/payment_report.dart';
import 'package:pospayment/controllers/billTest.dart';
import 'package:pospayment/controllers/callgetme.dart';
import 'package:pospayment/controllers/monthlyPayment.dart';
import 'package:pospayment/controllers/paidStore.dart';
import 'home.dart';
import 'package:get/get.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key key}) : super(key: key);

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  CounterController controller = Get.put(CounterController());
  RoomNameController room = Get.put(RoomNameController());
  paidStoreController paidStores = Get.put(paidStoreController());
  billTestController bills = Get.put(billTestController());
  @override
  void initState() {
    super.initState();
    controller.getData();
    room.getRoomName();
    paidStores.paidStore();
    bills.getBillTest();
  }

  int _selectedIndex = 0;
  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    PaymentOfDay(),
    PaymentOfMonth(),
    PaymentReport(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.users.value == null
            ? 'null'
            : controller.users.value.marketId.name)),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.blue,
            child: const Icon(Icons.person, color: Colors.white, size: 50),
            onTap: () {
              Get.toNamed('/profile');
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ໜ້າຫຼັກ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            label: 'ລາຍເດືອນ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_gmailerrorred_outlined),
            label: 'ລາຍງານ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.teal,
    );
  }
}

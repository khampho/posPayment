import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pospayment/buttommenu/payment_of_month.dart';
import 'package:pospayment/buttommenu/payment_report.dart';
import 'package:pospayment/models/callgetme.dart';
import 'home.dart';
import 'package:get/get.dart';
class HomeMenu extends StatefulWidget {
  const HomeMenu({Key key}) : super(key: key);

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  CounterController controller = Get.put(CounterController());
  // @override
  // void initState() {
  //   super.initState();
  //   controller.getData();
  // }
  int _selectedIndex = 0;
  static  TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    PaymentOfDay(),
    PaymentOfMonth(),
    PaymentReport(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controller.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(()=> Text(controller.users.value.marketId.name)),
        backgroundColor: Colors.tealAccent.shade400,
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
        iconSize: 40,
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
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

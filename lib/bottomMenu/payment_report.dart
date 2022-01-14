import 'package:flutter/material.dart';
import 'package:pospayment/bottomMenu/reportMenu/daily_income.dart';
import 'package:pospayment/bottommenu/reportMenu/outstanding.dart';
import 'package:pospayment/bottommenu/reportMenu/paidStore.dart';
import 'package:pospayment/bottommenu/reportMenu/pending.dart';

class PaymentReport extends StatefulWidget {
  const PaymentReport({Key key}) : super(key: key);

  @override
  _PaymentReportState createState() => _PaymentReportState();
}

class _PaymentReportState extends State<PaymentReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white70,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      // splashColor: Colors.yellow,
                      // highlightColor: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 40,
                                    height: 30,
                                    margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/price_icon.png',
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ))),
                              ),
                              Flexible(
                                  child: Text('ລາຍຮັບປະຈຳວັນ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green))),
                            ]),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const DailyIncome();
                            }),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      // splashColor: Colors.yellow,
                      // highlightColor: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 40,
                                    height: 30,
                                    margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/price_icon.png',
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ))),
                              ),
                              Flexible(
                                  child: Text('ປະຫວັດການຖອກຊຳລະ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green))),
                            ]),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const OutStanding();
                            }),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      // splashColor: Colors.yellow,
                      // highlightColor: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 40,
                                    height: 30,
                                    margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/price_icon.png',
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ))),
                              ),
                              Flexible(
                                  child: Text('ຮ້ານທີ່ຊຳລະແລ້ວ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green))),
                            ]),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const paidStore();
                            }),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      // splashColor: Colors.yellow,
                      // highlightColor: Colors.blue,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: 40,
                                    height: 30,
                                    margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/price_icon.png',
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ))),
                              ),
                              Flexible(
                                  child: Text('ຮ້ານຄ້າທີ່ຄ້າງຊຳລະ',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green))),
                            ]),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const Pending();
                            }),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 350,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.tealAccent.shade700,
    );
  }
}

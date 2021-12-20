import 'package:flutter/material.dart';
import 'package:pospayment/Screens/profile.dart';
import 'package:pospayment/buttommenu/reportMenu/daily_income.dart';
import 'package:pospayment/buttommenu/reportMenu/monthly_income.dart';
import 'package:pospayment/buttommenu/reportMenu/outstanding.dart';
import 'package:pospayment/buttommenu/reportMenu/repayment.dart';
import 'package:pospayment/models/memodel.dart';

import 'package:pospayment/models/callgetme.dart';

class PaymentReport extends StatefulWidget {
  const PaymentReport({Key key}) : super(key: key);

  @override
  _PaymentReportState createState() => _PaymentReportState();
}

class _PaymentReportState extends State<PaymentReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Memodel>(
            future: getme(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.marketId.name);
              }else{
                return const Text('waitting');
              }
            }),
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
                              Container(
                                  width: 70,
                                  height: 50,
                                  margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/price_icon.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ))),
                              Flexible(
                                  child: Text('ລາຍຮັບປະຈຳວັນ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.green))),
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
                              Container(
                                  width: 70,
                                  height: 50,
                                  margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/price_icon.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ))),
                              Flexible(
                                  child: Text('ລາຍຮັບປະຈຳເດືອນ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.green))),
                            ]),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const MonthlyIncome();
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
                              Container(
                                  width: 70,
                                  height: 50,
                                  margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/price_icon.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ))),
                              Flexible(
                                  child: Text('ຖອກຊຳລະ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.green))),
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
                              Container(
                                  width: 70,
                                  height: 50,
                                  margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/price_icon.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ))),
                              Flexible(
                                  child: Text('ຮ້ານຄ້າທີ່ຄ້າງຊຳລະ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.green))),
                            ]),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const RePayment();
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
      // backgroundColor: Colors.green,
    );
  }
}

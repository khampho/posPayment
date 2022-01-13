import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pospayment/apiurl/dailyIncomeReport.dart';
import 'package:pospayment/models/dailyIncomeModel.dart';

class DailyIncome extends StatefulWidget {
  const DailyIncome({Key key}) : super(key: key);

  @override
  _DailyIncomeState createState() => _DailyIncomeState();
}

class _DailyIncomeState extends State<DailyIncome> {
  var f = NumberFormat('###,###,##0', "en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍຮັບປະຈຳວັນ'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          FutureBuilder<DailyIncomeModel>(
            future: getDailyIncome(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 304,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 3),
                          ],
                        ),
                        child: Center(
                          child: Text(
                              "ຍອດເງິນລວມ : " +
                                  f.format(snapshot.data.totalPrice),
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          top: 1.0, start: 1.0, end: 1.0),
                      height: 2.0,
                      color: Colors.teal,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'ເລກທີ :',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text('ເວລາ :',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('ຈຳນວນ :',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(
                          top: 1.0, start: 1.0, end: 1.0),
                      height: 1.0,
                      color: Colors.teal,
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (_, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  snapshot.data.data[index].billNo,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                                Text(
                                  snapshot.data.data[index].time,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                                Text(
                                  f.format(snapshot.data.data[index].price),
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsetsDirectional.only(
                                top: 1.0, start: 1.0, end: 1.0),
                            height: 0.5,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 220),
                          child: Text(f.format(snapshot.data.totalPrice),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.flip_camera_android,
                    size: 50.0,
                  ),
                ));
              }
            },
          ),
        ],
      ),
      //  backgroundColor: Colors.tealAccent.shade400,
    );
  }
}

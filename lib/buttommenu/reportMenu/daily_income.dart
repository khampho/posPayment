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
        centerTitle: true,
        backgroundColor: Colors.tealAccent.shade400,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FutureBuilder<DailyIncomeModel>(
              future: getDailyIncome(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      //     Container(
                      //       width: 300,
                      //       height: 50,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: Colors.white,
                      //         boxShadow: const [
                      //           BoxShadow(color: Colors.grey, spreadRadius: 3),
                      //         ],
                      //       ),
                      //       child: const Center(
                      //         child: Text('ລາຍຮັບມື້ນີ້ : 300,000  ກີບ',
                      //             style:
                      //                 TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      //       ),
                      //     ),

                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'ເລກທີ',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('ເວລາ',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ))
                              ],
                            ),
                            Column(
                              children: const [
                                Text('ຈຳນວນ',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (_, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return const Text('');
                }
              },
            ),
          ],
        ),
      ),
      //  backgroundColor: Colors.tealAccent.shade400,
    );
  }
}

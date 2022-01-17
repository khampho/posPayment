import 'package:flutter/material.dart';

class MonthlyIncome extends StatefulWidget {
  const MonthlyIncome({Key key}) : super(key: key);

  @override
  _MonthlyIncomeState createState() => _MonthlyIncomeState();
}

class _MonthlyIncomeState extends State<MonthlyIncome> {
  final List<DataId> _Data = [
    DataId(id: 1115, time: '10:30', qty: 2000),
    DataId(id: 112, time: '10:30', qty: 5000),
    DataId(id: 113, time: '10:30', qty: 7000),
    DataId(id: 114, time: '10:30', qty: 1200),
    DataId(id: 111, time: '10:30', qty: 2000),
    DataId(id: 112, time: '10:30', qty: 5000),
    DataId(id: 113, time: '10:30', qty: 7000),
    DataId(id: 114, time: '10:30', qty: 1000),
    DataId(id: 111, time: '10:30', qty: 2000),
    DataId(id: 112, time: '10:30', qty: 5000),
    DataId(id: 113, time: '10:30', qty: 7000),
    DataId(id: 114, time: '10:30', qty: 1000),
    DataId(id: 111, time: '10:30', qty: 2000),
    DataId(id: 112, time: '10:30', qty: 5000),
    DataId(id: 113, time: '10:30', qty: 7000),
    DataId(id: 114, time: '10:30', qty: 1200),
    DataId(id: 155, time: '10:30', qty: 2000),
    DataId(id: 112, time: '10:30', qty: 5000),
    DataId(id: 113, time: '10:30', qty: 7000),
    DataId(id: 114, time: '10:30', qty: 1000),
    DataId(id: 111, time: '10:30', qty: 2000),
    DataId(id: 112, time: '10:30', qty: 5000),
    DataId(id: 113, time: '10:30', qty: 7000),
    DataId(id: 114, time: '11:30', qty: 1000),
    DataId(id: 112, time: '17:30', qty: 5000),
    DataId(id: 113, time: '18:30', qty: 7000),
    DataId(id: 118, time: '19:30', qty: 1000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍຮັບປະຈຳເດືອນ'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              width: 324,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.grey, spreadRadius: 3),
                ],
              ),
              child: const Center(
                child: Text('ເງິນລວມ : 300,000  ກີບ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'ເລກທີ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text('ເວລາ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('ຈຳນວນ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  top: 1.0, start: 1.0, end: 1.0),
              height: 0.7,
              color: Colors.teal,
            ),
            SizedBox(
              height: 570,
              //padding: EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _Data.length,
                  itemBuilder: (context, int index) {
                    return SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            _Data[index].id.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            _Data[index].time,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            _Data[index].qty.toString() + " ກີບ",
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataId {
  final int id;
  var time;
  final int qty;
  DataId({this.id, this.time, this.qty});
}

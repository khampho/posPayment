import 'package:flutter/material.dart';

class OutStandingReportOfMonth extends StatefulWidget {
  const OutStandingReportOfMonth({Key key}) : super(key: key);

  @override
  _OutStandingReportOfMonthState createState() =>
      _OutStandingReportOfMonthState();
}

class _OutStandingReportOfMonthState extends State<OutStandingReportOfMonth> {
  final List<DataId> _Data = [
    DataId(id: 111, time: '22/01/2022', qty: 5000),
    DataId(id: 112, time: '22/01/2022', qty: 5000),
    DataId(id: 113, time: '22/01/2022', qty: 6000),
    DataId(id: 114, time: '22/01/2022', qty: 8200),
    DataId(id: 111, time: '22/01/2022', qty: 8000),
    DataId(id: 112, time: '22/01/2022', qty: 2000),
    DataId(id: 114, time: '22/01/2022', qty: 4400),
    DataId(id: 111, time: '22/01/2022', qty: 4400),
    DataId(id: 112, time: '22/01/2022', qty: 6000),
    DataId(id: 113, time: '22/01/2022', qty: 8000),
    DataId(id: 118, time: '22/01/2022', qty: 8000),
    DataId(id: 111, time: '22/01/2022', qty: 2000),
    DataId(id: 112, time: '22/01/2022', qty: 5000),
    DataId(id: 113, time: '22/01/2022', qty: 7000),
    DataId(id: 114, time: '22/01/2022', qty: 1200),
    DataId(id: 111, time: '22/01/2022', qty: 2000),
    DataId(id: 112, time: '22/01/2022', qty: 5000),
    DataId(id: 114, time: '22/01/2022', qty: 1000),
    DataId(id: 111, time: '22/01/2022', qty: 2000),
    DataId(id: 112, time: '22/01/2022', qty: 5000),
    DataId(id: 113, time: '22/01/2022', qty: 7000),
    DataId(id: 118, time: '22/01/2022', qty: 1000),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'ເລກທີ',
                    style: TextStyle(fontSize: 17),
                  ),
                  Text('ວັນທີ',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  Text('ຈຳນວນ',
                      style: TextStyle(
                        fontSize: 17,
                      ))
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
                top: 1.0, start: 1.0, end: 1.0),
            height: 0.5,
            color: Colors.grey,
          ),
          SizedBox(
            height: 560,
            width: 300,
            //padding: EdgeInsets.only(top: 20),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _Data.length,
              itemBuilder: (context, int index) {
                return SingleChildScrollView(
                  child: Row(
                    children: [
                      Text(
                        _Data[index].id.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Spacer(),
                      Text(
                        _Data[index].time.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Spacer(),
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
        ],
      ),
    );
  }
}

class DataId {
  int id;
  String time;
  int qty;
  DataId({this.id, this.time, this.qty});
}

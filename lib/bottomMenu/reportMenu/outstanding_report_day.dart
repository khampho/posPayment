import 'package:flutter/material.dart';

class OutstandingReportOfDay extends StatefulWidget {
  const OutstandingReportOfDay({Key key}) : super(key: key);

  @override
  _OutstandingReportOfDayState createState() => _OutstandingReportOfDayState();
}

class _OutstandingReportOfDayState extends State<OutstandingReportOfDay> {
  final List<DataId> _Data = [
    DataId(id: 111, time: '22/01/2022', qty: 2000),
    DataId(id: 112, time: '22/01/2022', qty: 5000),
    DataId(id: 113, time: '22/01/2022', qty: 7000),
    DataId(id: 114, time: '22/01/2022', qty: 1200),
    DataId(id: 111, time: '22/01/2022', qty: 2000),
    DataId(id: 112, time: '22/01/2022', qty: 5000),
    DataId(id: 114, time: '22/01/2022', qty: 1000),
    DataId(id: 111, time: '22/01/2022', qty: 2000),
    DataId(id: 112, time: '22/01/2022', qty: 5000),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'ງວດທີ່',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'ເລກທີ',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Text('ວັນທີ',
                  style: TextStyle(
                    fontSize: 17,
                  )),
              Text('ຈຳນວນ', style: TextStyle(fontSize: 17)),
            ],
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
                top: 1.0, start: 1.0, end: 1.0),
            height: 0.5,
            color: Colors.grey,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: _Data.length,
            itemBuilder: (context, int index) {
              return SingleChildScrollView(
                child: Row(
                  children: [
                    Text(
                      _Data[index].id.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _Data[index].time,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Spacer(),
                    Text(
                      _Data[index].qty.toString() + " ກີບ",
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
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

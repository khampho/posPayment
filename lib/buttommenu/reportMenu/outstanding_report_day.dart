import 'package:flutter/material.dart';
class OutstandingReportOfDay extends StatefulWidget {
  const OutstandingReportOfDay({Key? key}) : super(key: key);

  @override
  _OutstandingReportOfDayState createState() => _OutstandingReportOfDayState();
}

class _OutstandingReportOfDayState extends State<OutstandingReportOfDay> {
  final List<DataId> _Data = [
    DataId(id: 111, time: '22/01/2022',qty: 2000),
    DataId(id: 112, time: '22/01/2022',qty: 5000),
    DataId(id: 113, time: '22/01/2022',qty: 7000),
    DataId(id: 114, time: '22/01/2022',qty: 1200),
    DataId(id: 111, time: '22/01/2022',qty: 2000),
    DataId(id: 112, time: '22/01/2022',qty: 5000),
    DataId(id: 114, time: '22/01/2022',qty: 1000),
    DataId(id: 111, time: '22/01/2022',qty: 2000),
    DataId(id: 112, time: '22/01/2022',qty: 5000),
    DataId(id: 113, time: '22/01/2022',qty: 7000),
    DataId(id: 118, time: '22/01/2022',qty: 1000),
    DataId(id: 111, time: '22/01/2022',qty: 2000),
    DataId(id: 112, time: '22/01/2022',qty: 5000),
    DataId(id: 113, time: '22/01/2022',qty: 7000),
    DataId(id: 114, time: '22/01/2022',qty: 1200),
    DataId(id: 111, time: '22/01/2022',qty: 2000),
    DataId(id: 112, time: '22/01/2022',qty: 5000),
    DataId(id: 114, time: '22/01/2022',qty: 1000),
    DataId(id: 111, time: '22/01/2022',qty: 2000),
    DataId(id: 112, time: '22/01/2022',qty: 5000),
    DataId(id: 113, time: '22/01/2022',qty: 7000),
    DataId(id: 118, time: '22/01/2022',qty: 1000),
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
                      Text('ເລກທີ',style: TextStyle(fontSize: 17,),),
                      Text('ວັນທີ',style: TextStyle(fontSize: 17,)),
                      Text('ຈຳນວນ',style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
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
                  child:Row(
                    children: [
                      Text(_Data[index].id.toString() ,style: const TextStyle(fontSize: 15,),),
                      const Spacer(),
                      Text(_Data[index].time,style: const TextStyle(fontSize: 15),),
                      const Spacer(),
                      Text(_Data[index].qty.toString()+ " ກີບ",style: const TextStyle(fontSize: 15),)
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) => const Divider(),
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
  DataId({required this.id, required this.time, required this.qty});
}
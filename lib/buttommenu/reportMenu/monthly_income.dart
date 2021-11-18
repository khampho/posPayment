import 'package:flutter/material.dart';
class MonthlyIncome extends StatefulWidget {
  const MonthlyIncome({Key? key}) : super(key: key);

  @override
  _MonthlyIncomeState createState() => _MonthlyIncomeState();
}

class _MonthlyIncomeState extends State<MonthlyIncome> {
  final List<DataId> _Data = [
    DataId(id: 1115, time: '10:30',qty: 2000),
    DataId(id: 112, time: '10:30',qty: 5000),
    DataId(id: 113, time: '10:30',qty: 7000),
    DataId(id: 114, time: '10:30',qty: 1200),
    DataId(id: 111, time: '10:30',qty: 2000),
    DataId(id: 112, time: '10:30',qty: 5000),
    DataId(id: 113, time: '10:30',qty: 7000),
    DataId(id: 114, time: '10:30',qty: 1000),
    DataId(id: 111, time: '10:30',qty: 2000),
    DataId(id: 112, time: '10:30',qty: 5000),
    DataId(id: 113, time: '10:30',qty: 7000),
    DataId(id: 114, time: '10:30',qty: 1000),
    DataId(id: 111, time: '10:30',qty: 2000),
    DataId(id: 112, time: '10:30',qty: 5000),
    DataId(id: 113, time: '10:30',qty: 7000),
    DataId(id: 114, time: '10:30',qty: 1200),
    DataId(id: 111545, time: '10:30',qty: 2000),
    DataId(id: 112, time: '10:30',qty: 5000),
    DataId(id: 113, time: '10:30',qty: 7000),
    DataId(id: 114, time: '10:30',qty: 1000),
    DataId(id: 111, time: '10:30',qty: 2000),
    DataId(id: 112, time: '10:30',qty: 5000),
    DataId(id: 113, time: '10:30',qty: 7000),
    DataId(id: 114, time: '11:30',qty: 1000),
    DataId(id: 112, time: '17:30',qty: 5000),
    DataId(id: 113, time: '18:30',qty: 7000),
    DataId(id: 118, time: '19:30',qty: 1000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍຮັບປະຈຳເດືອນ'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
           Container(
                width: 324,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, spreadRadius: 3),
                  ],
                ),
                child: const Center(
                  child: Text('ເງິນລວມ : 300,000  ກີບ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                ),
              ),
            const SizedBox(height: 5,),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [

                        Text('ເລກທີ',style: TextStyle(fontSize: 20,),),

                        Text('ເວລາ',style: TextStyle(fontSize: 20,)),

                        Text('ຈຳນວນ',style: TextStyle(fontSize: 20,))
                  ],
                ),
              ),

            SizedBox(
              height: 570,
              //padding: EdgeInsets.only(top: 20),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: _Data.length,
                itemBuilder: (context, int index) {
                  return SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_Data[index].id.toString() ,style: const TextStyle(fontSize: 15,),),
                          Text(_Data[index].time,style: const TextStyle(fontSize: 15,),),
                          Text(_Data[index].qty.toString()+ " ກີບ",style: const TextStyle(fontSize: 15,),)
                        ],
                      ),
                  );
                }, separatorBuilder: (BuildContext context, int index) => const Divider(),
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
  DataId({required this.id, this.time, required this.qty});
}
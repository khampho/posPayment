import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
class BillDailyIncome extends StatefulWidget {
  const BillDailyIncome({Key? key}) : super(key: key);

  @override
  _BillDailyIncomeState createState() => _BillDailyIncomeState();
}

class _BillDailyIncomeState extends State<BillDailyIncome> {
  get box => GetStorage();

  final String _date = 'ວັນທີ: 22/10/2021';
  final List<Data> _data = [
    Data(no: 1,lists: 'ຂີ້ເຫຍື້ອ',service: 30000),
    Data(no: 2,lists: 'ຂີ້ເຫຍື້ອ',service: 30000),
    Data(no: 3,lists: 'ຂີ້ເຫຍື້ອ',service: 30000),
    Data(no: 4,lists: 'ຂີ້ເຫຍື້ອ',service: 30000),
    Data(no: 5,lists: 'ຂີ້ເຫຍື້ອ',service: 30000),
    Data(no: 6,lists: 'ຂີ້ເຫຍື້ອ',service: 30000),
    Data(no: 7,lists: 'ຂີ້ເຫຍື້ອ',service: 30000),
    Data(no: 8,lists: 'ຂີ້ເຫຍື້ອ',service: 30000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ໃບບິນ'),
        //centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {               },
                child: const Icon(
                  Icons.print,
                  color: Colors.black,
                  size: 40,
                ),
              )
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network('http://139.59.225.42/v1/uploads/market/' + box.read('M_logo') ,width: 90,),

                           Text(box.read('M_name')),
                        ],
                      ),
                      const Text('ໃບບິນ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_date),
                          const Text('ເລກທີ່ : 203'),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.grey,width: 0.2),
                          children: const [
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('ລຳດັບ')),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('ລາຍການ')),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text('ຄ່າບໍລິການ')),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          //physics: const AlwaysScrollableScrollPhysics(),
                          // physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _data.length,
                          itemBuilder: (context, int index) {
                            return builItem(index);
                          }
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 3),
                            ],
                          ),
                          height: 40,

                          child: const Center(
                            child: Text('ເງິນລວມ : 350,000  ກີບ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 200),
                        child: const Text('ຜູ້ເກັບເງິນ : '),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 150),
                        child: Text(box.read('name')),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20,top: 40),
                        child:  Text('ຫ້ອງການຕະຫຼາດ : '+ box.read('M_phone')),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
  Widget builItem(int index){
    return Center(
      child: Table(
        border: TableBorder.all(color: Colors.grey,width: 0.2),
        children: [
          TableRow(children: [
            Center(child: Text(_data[index].no.toString() ,style: const TextStyle(fontSize: 15),),),
            Center(child: Text(_data[index].lists,style: const TextStyle(fontSize: 15),)),
            Center(child: Text(_data[index].service.toString(),style: const TextStyle(fontSize: 15),))
          ]),
        ],
      ),
    );
  }
}

class Data {
  final int no;
  String lists;
  final int service;
  Data( {required this.no, required this.lists,required this.service});
}


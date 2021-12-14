import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pospayment/models/dailybillmodel.dart';
import 'package:pospayment/models/profile.dart';

class BillDailyIncome extends StatefulWidget {
  const BillDailyIncome({Key key}) : super(key: key);

  @override
  _BillDailyIncomeState createState() => _BillDailyIncomeState();
}

class _BillDailyIncomeState extends State<BillDailyIncome> {
  get box => GetStorage();
  var f = NumberFormat('###,###,##0 ກີບ', "en_US");

  Future<DataModel> getbillData() async {
    String token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";

    Response response = await Dio().get('https://jsonkeeper.com/b/N1ZL');

    print(response.data['datas']);

    DataModel items = DataModel.fromJson(response.data);
    print(items);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ບິນເກັບເງິນມື້'),
        //centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.blue,
            child: const Icon(Icons.print, color: Colors.white, size: 50),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return;
                }));
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                            Image.network(
                              'http://139.59.225.42/v1/uploads/market/' +
                                  box.read('M_logo'),
                              width: 90,
                            ),
                            Text(box.read('M_name')),
                          ],
                        ),
                        const Text(
                          'ໃບບິນເກັບເງິນມື້',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        FutureBuilder<DataModel>(
                          future: getbillData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('ວັນທີ : ' +
                                          snapshot.data.date.toString()),
                                      Text('ເລກທີ່ : ' +
                                          snapshot.data.billNo.toString()),
                                    ],
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Table(
                                      border: TableBorder.all(
                                          color: Colors.grey, width: 0.2),
                                      children: const [
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(child: Text('ລຳດັບ')),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child:
                                                Center(child: Text('ລາຍການ')),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text('ຄ່າບໍລິການ')),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.datas.length,
                                    itemBuilder: (_, index) => Table(
                                      border: TableBorder.all(
                                          color: Colors.grey, width: 0.2),
                                      children: [
                                        TableRow(children: [
                                          Center(
                                            child: Text(
                                              '${index + 1}',
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          Center(
                                              child: Text(
                                            snapshot.data.datas[index].list,
                                            style:
                                                const TextStyle(fontSize: 15),
                                          )),
                                          Center(
                                              child: Text(
                                            f.format(snapshot
                                                .data.datas[index].price),
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ))
                                        ]),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 3),
                                        ], //anydesk
                                      ),
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                            'ລວມເງິນ : ' +
                                                f.format(int.parse(
                                                    snapshot.data.totalPrice)),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Text('ກະລຸນາລໍຖ້າ');
                              //return const Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 200),
                          child: const Text('ຜູ້ເກັບເງິນ : '),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 150),
                          child: Text(box.read('P_fname').toString()),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20, top: 40),
                          child: Text('ຫ້ອງການຕະຫຼາດ : ' +
                              box.read('M_phone').toString()),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
}

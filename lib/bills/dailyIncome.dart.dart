import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/apiUrl/token.dart';
import 'package:pospayment/controllers/callgetme.dart';
import 'package:pospayment/format/number.dart';
import 'package:pospayment/models/dailybillmodel.dart';
import 'package:get/get.dart';

class BillDailyIncome extends StatefulWidget {
  const BillDailyIncome({Key key}) : super(key: key);

  @override
  _BillDailyIncomeState createState() => _BillDailyIncomeState();
}

class _BillDailyIncomeState extends State<BillDailyIncome> {
  get box => GetStorage();
  Future<DataModel> getbillData() async {
    String token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await Dio().get('https://jsonkeeper.com/b/N1ZL');
    DataModel items = DataModel.fromJson(response.data);
    //print(response);
    return items;
  }

  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ບິນເກັບເງິນມື້'),
        //centerTitle: true,
        backgroundColor: Colors.teal,
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
                            Obx(() => Image.network(
                                  'http://139.59.225.42/v1/uploads/market/' +
                                      controller.users.value.marketId.logo,
                                  width: 90,
                                )),
                            Obx(
                              () => Text(controller.users.value.marketId.name),
                            ),
                          ],
                        ),
                        const Text(
                          'ໃບບິນ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
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
                          child: Obx(
                            () => AutoSizeText(
                              controller.users.value.firstName +
                                  ' ' +
                                  controller.users.value.lastName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 13),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20, top: 40),
                          child: Obx(() => Text("ຫ້ອງການຕະຫລາດ : " +
                              controller.users.value.marketId.telephone)),
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
      backgroundColor: Colors.teal,
    );
  }
}

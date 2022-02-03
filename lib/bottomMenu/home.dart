import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';
import 'package:pospayment/apiUrl/api.dart';
import 'package:get/get.dart';
import 'package:pospayment/apiUrl/incomeHistory.dart';
import 'package:pospayment/controllers/callgetme.dart';
import 'package:http/http.dart' as http;
import 'package:pospayment/format/date.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentOfDay extends StatefulWidget {
  const PaymentOfDay({Key key}) : super(key: key);
  @override
  _PaymentOfDayState createState() => _PaymentOfDayState();
}

class _PaymentOfDayState extends State<PaymentOfDay> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _roomId = TextEditingController();
  CounterController controller = Get.put(CounterController());
  TextEditingController amount = TextEditingController();

  postRoomId() async {
    var client = http.Client();
    try {
      var rs =
          await client.post(Uri.parse(apiBaseUrl + '/api/make-pos'), body: {
        'venue_amount': amount.text,
        'room_id': _roomId.text,
        'payment_date': dateFormat.format(DateTime.now())
      });
      print('Response status: ${rs.statusCode}');
      print('Response body: ${rs.body}');
      if (rs.statusCode == 401) {
        return showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  //title:  Text(paidStores.paidStoreData[index].name),
                  content: Container(
                    height: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [const Text('Bill error')],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
                ));
      }
    } finally {
      client.close();
    }
  }

  GlobalKey _globalKey = new GlobalKey();

  Future<Uint8List> _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 1.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      print(e);
      return e;
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: 1000,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                // Obx(
                //   () => ClipRRect(
                //     borderRadius: BorderRadius.circular(100.0),
                //     child: Image.network(
                //       controller.users.value == null
                //           ? 'https://cdn.logo.com/hotlink-ok/logo-social.png'
                //           : 'http://139.59.225.42/v1/uploads/market/' +
                //               controller.users.value.marketId.logo,
                //       height: 150.0,
                //       width: 150.0,
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 85.0,
                        padding: const EdgeInsets.only(top: 30, bottom: 8.0),
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'amount!';
                              } else {
                                return null;
                              }
                            },
                            controller: amount,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.lightGreen,
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 2.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'amount',
                              labelStyle: const TextStyle(
                                  color: Colors.green, fontSize: 15),
                              prefixIcon: const Icon(
                                Icons.vpn_key,
                                color: Colors.green,
                                size: 20.0,
                              ),
                            )),
                      ),
                      Container(
                        width: 300,
                        height: 85.0,
                        padding: const EdgeInsets.only(top: 8.0, bottom: 30),
                        child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ກະລຸນາປ້ອນລະຫັດຮ້ານ!';
                              } else {
                                return null;
                              }
                            },
                            controller: _roomId,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.lightGreen,
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 2.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              labelText: 'ລະຫັດຮ້ານ',
                              labelStyle: const TextStyle(
                                  color: Colors.green, fontSize: 15),
                              prefixIcon: const Icon(
                                Icons.vpn_key,
                                color: Colors.green,
                                size: 20.0,
                              ),
                            )),
                      ),
                      SizedBox(
                          width: 300,
                          child: TextButton(
                              onPressed: () {
                                getIncomeHistory();
                              },
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(12.0),
                                  primary: Colors.white,
                                  backgroundColor: Colors.green,
                                  textStyle: const TextStyle(fontSize: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(color: Colors.green),
                                  )),
                              child: const Text(
                                'ອອກບິນ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                      top: 10.0, start: 1.0, end: 1.0),
                  height: 1.0,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: const Center(
                      child: Text('ເງິນລວມ : 350,000,000  ກີບ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RepaintBoundary(
                    key: _globalKey,
                    child: Container(
                      color: Colors.white,
                      child: QrImage(
                        data: "12345gfgf67890",
                        version: QrVersions.auto,
                        size: 150.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: const Icon(
            Icons.qr_code_scanner_outlined,
            color: Colors.white,
            size: 50,
          ),
          backgroundColor: Colors.tealAccent.shade400,
          //const Color(0xFFA6F338),
          onPressed: () async {
            //Get.toNamed('/qrScan');
            await _capturePng();
            _print();
          }),
      backgroundColor: Colors.tealAccent.shade700,
    );
  }

  _print() async {
    // ByteData bytes = await rootBundle.load('');
    final buffer = await _capturePng();
    final imgData = base64.encode(buffer);
    SunmiPrinter.image(imgData,align: SunmiAlign.center);
    SunmiPrinter.emptyLines(3);
  }
}

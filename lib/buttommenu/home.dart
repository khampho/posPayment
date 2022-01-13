import 'package:flutter/material.dart';
import 'package:pospayment/bills/dailyIncome.dart.dart';
import 'package:get/get.dart';
import 'package:pospayment/controllers/callgetme.dart';

class PaymentOfDay extends StatefulWidget {
  const PaymentOfDay({Key key}) : super(key: key);
  @override
  _PaymentOfDayState createState() => _PaymentOfDayState();
}

class _PaymentOfDayState extends State<PaymentOfDay> {
  final _formKey = GlobalKey<FormState>();
  final _roomId = TextEditingController();
  CounterController controller = Get.put(CounterController());
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
                  height: 30.0,
                ),
                Obx(
                  () => ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      controller.users.value == null
                          ? 'https://cdn.logo.com/hotlink-ok/logo-social.png'
                          : 'http://139.59.225.42/v1/uploads/market/' +
                              controller.users.value.marketId.logo,
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    width: 300,
                    height: 110,
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
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
                ),
                SizedBox(
                    width: 300,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const BillDailyIncome();
                          }));
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
                  padding: const EdgeInsets.only(top:18.0),
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
          onPressed: () {
            Get.toNamed('/qrScan');
          }),
      backgroundColor: Colors.tealAccent.shade700,
    );
  }
}

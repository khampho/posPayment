import 'package:flutter/material.dart';
import 'package:pospayment/Screens/profile.dart';
import 'package:pospayment/Screens/qr_scan.dart';
import 'package:pospayment/bills/dailyIncome.dart.dart';
import 'package:pospayment/models/callgetme.dart';
import 'package:pospayment/models/memodel.dart';

class PaymentOfDay extends StatefulWidget {
  const PaymentOfDay({Key key}) : super(key: key);
  @override
  _PaymentOfDayState createState() => _PaymentOfDayState();
}
class _PaymentOfDayState extends State<PaymentOfDay> {
  final _formKey = GlobalKey<FormState>();
  final _roomId = TextEditingController();
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  FutureBuilder<Memodel>(
        future: getme(),
        builder: (_, snapshot)  {
          if (snapshot.hasData) {
            return Text(snapshot.data.marketId.name);
          }else{
            return const Text('waitting');
          }
        }),
        backgroundColor: Colors.tealAccent.shade400,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            splashColor: Colors.yellow,
            highlightColor: Colors.blue,
            child: const Icon(Icons.person, color: Colors.white, size: 50),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  Profile();
                }));
              });
            },
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: 1000,
        child: Card(
          // color: Colors.tealAccent.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                FutureBuilder<Memodel>(
                future: getme(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.network(
                        'http://139.59.225.42/v1/uploads/market/' +
                            snapshot.data.marketId.logo,
                        height: 150.0,
                        width: 150.0,
                        fit: BoxFit.fill,
                      ),
                    );
                  }else{
                    return const Text('waitting');
                  }

                }),
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
                          labelStyle: const TextStyle(color: Colors.green,fontSize: 15),
                          prefixIcon: const Icon(
                            Icons.vpn_key,
                            color: Colors.green,
                            size: 20.0,
                          ),
                        )
                    ),
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
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'ລາຍຮັບລວມມື້ນີ້ : ' + ' 220,000 ກີບ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          }),
      backgroundColor: Colors.tealAccent.shade400,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:pospayment/Screens/profile.dart';
import 'package:pospayment/Screens/qr_scan.dart';
import 'package:pospayment/bills/dailyIncome.dart.dart';

class PaymentOfDay extends StatefulWidget {
   const PaymentOfDay({Key? key}) : super(key: key);
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
      body: SizedBox(
        width: double.infinity,
        height: 1000,
        child: Card(
          color: Colors.white70,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network('http://139.59.225.42/v1/uploads/market/' + box.read('M_logo'),
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.only(bottom: 25,top: 50.0),
                    child: TextField(
                      controller: _roomId,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true, // dont forget this line
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.green, width: 2.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.green, width: 2.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          label: const Text(
                            'ລະຫັດຮ້ານ : ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 300,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (
                                  context){
                                return  const BillDailyIncome();
                              }
                          )
                          );
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            backgroundColor: Colors.green,
                            textStyle: const TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.green),
                            )),
                        child: const Text('ອອກບິນ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                        )
                    )
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin:  const EdgeInsetsDirectional.only(top: 10.0,start: 1.0, end: 1.0),
                  height: 1.0,
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'ລາຍຮັບມື້ນີ້ :',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                        child: Column(
                          children:  const <Widget>[
                            Text('330,0000 ກີບ', style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: const Icon(Icons.qr_code_scanner_outlined,
              color: Colors.green,size: 50,),
            backgroundColor: Colors.white,
            //const Color(0xFFA6F338),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const QRViewExample(),
              ));
            }
        )
    );
  }
}
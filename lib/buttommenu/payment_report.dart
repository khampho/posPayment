import 'package:flutter/material.dart';
import 'package:pospayment/buttommenu/reportMenu/daily_income.dart';
import 'package:pospayment/buttommenu/reportMenu/monthly_income.dart';
import 'package:pospayment/buttommenu/reportMenu/outstanding.dart';
import 'package:pospayment/buttommenu/reportMenu/repayment.dart';

//body["data"][1][roomitems][0][service_items][price]

class PaymentReport extends StatefulWidget {
  const PaymentReport({Key? key}) : super(key: key);

  @override
  _PaymentReportState createState() => _PaymentReportState();
}

class _PaymentReportState extends State<PaymentReport> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Card(
        color: Colors.white70,
        child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5,),
                   Card(
                        child: TextButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                          onPressed: () {
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context){
                                  return const DailyIncome();
                                }
                              ),
                            );
                          },
                          icon: Image.asset('assets/images/price_icon.png',width: 70,),
                          label: const Text('ລາຍຮັບປະຈຳວັນ                         ',style: TextStyle(fontSize: 20,color: Colors.green),),
                        ),
                      ),

                      Card(
                      //padding: EdgeInsets.only(top: 10,left: 15),
                      child: TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context){
                                return const MonthlyIncome();
                              }
                          ),
                          );
                        },
                        icon: Image.asset('assets/images/price_icon.png',width: 70,),
                        label: const Text('ລາຍຮັບປະຈຳເດືອນ                     ',style: TextStyle(fontSize: 20, color: Colors.green),),
                      ),
                    ),
                    Card(
                      //padding: EdgeInsets.only(top: 10,left: 15),
                      child: TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context){
                                return const OutStanding();
                              }
                          ),
                          );
                        },
                        icon: Image.asset('assets/images/price_icon.png',width: 70,),
                        label: const Text('ຖອກຊຳລະ                                  ',style: TextStyle(fontSize: 20, color: Colors.green),),
                      ),
                    ),
                     Card(
                      //padding: EdgeInsets.only(top: 10,left: 15),
                      child: TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context){
                                return const RePayment();
                              }
                          ),
                          );
                        },
                        icon: Image.asset('assets/images/price_icon.png',width: 70,),
                        label: const Text('ຮ້ານຄ້າທີ່ຄ້າງຊຳລະ                       ',style: TextStyle(fontSize: 20, color: Colors.green),),
                      ),
                    ),
                const SizedBox(height: 350,),
              ],
            ),
        ),

      ),
     // backgroundColor: Colors.green,
    );
  }
}
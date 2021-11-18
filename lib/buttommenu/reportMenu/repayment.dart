import 'package:flutter/material.dart';
class RePayment extends StatefulWidget {
  const RePayment({Key? key}) : super(key: key);

  @override
  _RePaymentState createState() => _RePaymentState();
}

class _RePaymentState extends State<RePayment> {
  final List<String> _data=["ຮ້ານ ນາງພອນໄຊ","ຮ້ານ 2","ຮ້ານ 3","ຮ້ານ 4","ຮ້ານ 5","ຮ້ານ 6","ຮ້ານ 7","ຮ້ານ 8","ຮ້ານ 9","ຮ້ານ 12","ຮ້ານ 13","ຮ້ານ 14","ຮ້ານ 9","ຮ້ານ 12","ຮ້ານ 13","ຮ້ານ 14"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("ຮ້ານທີ່ຍັງຄ້າງຊຳລະ"),
          backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount:_data.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,index){
            return _bilItem(index);
          }
      ),
    );
  }
  Widget _bilItem(int index){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,),
              child: Text(_data[index],style: const TextStyle(fontSize: 20),),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.cancel,size: 50,),
            ),
          ],
        ),
      ),
    );
  }
}


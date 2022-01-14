import 'package:flutter/material.dart';
import 'package:pospayment/controllers/paidStore.dart';
import 'package:pospayment/format/number.dart';
import 'package:pospayment/models/paidStore.dart';
import 'package:get/get.dart';

class Pending extends StatefulWidget {
  const Pending({Key key}) : super(key: key);

  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  paidStoreController pend = Get.put(paidStoreController());
  List<PaidStoreModel> customers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pend.paidStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ຮ້ານທີ່ຍັງຄ້າງຊຳລະ"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
          itemCount: customers.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return _bilItem(index);
          }),
    );
  }

  Widget _bilItem(int index) {
    return InkWell(
      splashColor: Colors.teal,
      //highlightColor: Colors.blue,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(pend.paidStoreData[index].name,
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Icon(
                  Icons.more_horiz,
                  size: 40,
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        return showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            //title:  Text(paidStores.paidStoreData[index].name),
            content: Container(
              height: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ຮ້ານ : '),
                      Text(pend.paidStoreData[index].name)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ວັນທີຊຳລະ : '),
                      Text(pend.paidStoreData[index].date)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ຈຳນວນເງິນ : '),
                      Text(f.format(pend.paidStoreData[index].price))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ໂຊນ : '),
                      Text(pend.paidStoreData[index].zone)
                    ],
                  ),
                ],
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
          ),
        );
      },
    );
  }
}

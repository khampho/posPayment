import 'package:flutter/material.dart';
import 'package:pospayment/controllers/paidStore.dart';
import 'package:get/get.dart';
import 'package:pospayment/format/number.dart';
import 'package:pospayment/models/paidStore.dart';

class paidStore extends StatefulWidget {
  const paidStore({Key key}) : super(key: key);

  @override
  _paidStoreState createState() => _paidStoreState();
}

class _paidStoreState extends State<paidStore> {
  paidStoreController paidStores = Get.put(paidStoreController());
  List<PaidStoreModel> customers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paidStores.paidStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ຮ້ານຄ້າທີ່ຊຳລະແລ້ວ'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
          itemCount: paidStores.paidStoreData.length,
          itemBuilder: (context, index) {
            return buildDat(index);
          }),
    );
  }

  Widget buildDat(int index) {
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
                Text(paidStores.paidStoreData[index].name,
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
                      Text(paidStores.paidStoreData[index].name)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ວັນທີຊຳລະ : '),
                      Text(paidStores.paidStoreData[index].date)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ຈຳນວນເງິນ : '),
                      Text(f.format(paidStores.paidStoreData[index].price))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ໂຊນ : '),
                      Text(paidStores.paidStoreData[index].zone)
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

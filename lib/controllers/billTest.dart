import 'package:get/get.dart';
import 'package:pospayment/apiUrl/billTest.dart';
import 'package:pospayment/models/dailybillmodel.dart';

class billTestController extends GetxController {
  DataModel datas = DataModel();

  getBillTest() async {
    DataModel data = await getBill();
    //print(data.);
    datas = data ;
    update();
  }
}
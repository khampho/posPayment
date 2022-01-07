import 'package:get/get.dart';
import 'package:pospayment/apiurl/paidStore.dart';
import 'package:pospayment/models/paidStore.dart';

class paidStoreController extends GetxController {
  List<PaidStoreModel> paidStoreData = List<PaidStoreModel>();

  paidStore() async {
    var Data = await getPaidStore();
    print(Data.length);
    paidStoreData = Data;
    update();
  }
}